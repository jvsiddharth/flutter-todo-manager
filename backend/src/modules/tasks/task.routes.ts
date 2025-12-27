import sql from '../../config/db';
import { classifyTask } from './classifier';
import { CreateTaskSchema } from './task.schema';

export async function taskRoutes(fastify: any) {

  fastify.post('/api/tasks', async (req: any) => {
    const data = CreateTaskSchema.parse(req.body);
    const classification = classifyTask(data.title, data.description);

    const [task] = await sql`
        INSERT INTO tasks (
            title,
            description,
            category,
            priority,
            assigned_to,
            due_date,
            extracted_entities,
            suggested_actions
        )
        VALUES (
            ${data.title},
            ${data.description},
            ${classification.category},
            ${classification.priority},
            ${data.assigned_to ?? null},
            ${data.due_date ?? null},
            ${sql.json(classification.extracted_entities)},
            ${sql.json(classification.suggested_actions)}
        )
        RETURNING *
        `;

    await sql`
      INSERT INTO task_history (task_id, action, new_value)
      VALUES (${task.id}, 'created', ${sql.json(task)})
    `;

    return task;
  });

  fastify.get('/api/tasks/:id', async (req: any, reply: any) => {
  const { id } = req.params;

  const [task] = await sql`
    SELECT * FROM tasks WHERE id = ${id}
  `;

  if (!task) {
    return reply.status(404).send({ error: 'Task not found' });
  }

  const history = await sql`
    SELECT *
    FROM task_history
    WHERE task_id = ${id}
    ORDER BY changed_at DESC
  `;

  return { task, history };
});
fastify.get('/api/tasks', async (req: any) => {
  const q = req.query || {};

  const limit = Number(q.limit ?? 10);
  const offset = Number(q.offset ?? 0);

  const conditions: any[] = [];

  if (q.status) {
    conditions.push(sql`status = ${q.status}`);
  }

  if (q.category) {
    conditions.push(sql`category = ${q.category}`);
  }

  if (q.priority) {
    conditions.push(sql`priority = ${q.priority}`);
  }

  if (q.search) {
    conditions.push(
      sql`(title ILIKE ${'%' + q.search + '%'} OR description ILIKE ${'%' + q.search + '%'})`
    );
  }

  let query = sql`SELECT * FROM tasks`;

  if (conditions.length > 0) {
    query = conditions.reduce(
      (acc, condition, index) =>
        index === 0
          ? sql`${acc} WHERE ${condition}`
          : sql`${acc} AND ${condition}`,
      query
    );
  }

  query = sql`
    ${query}
    ORDER BY created_at DESC
    LIMIT ${limit}
    OFFSET ${offset}
  `;

  const tasks = await query;
  return tasks;
});

fastify.patch('/api/tasks/:id', async (req: any, reply: any) => {
  const { id } = req.params;
  const updates = req.body;

  const [oldTask] = await sql`
    SELECT * FROM tasks WHERE id = ${id}
  `;

  if (!oldTask) {
    return reply.status(404).send({ error: 'Task not found' });
  }

  const [updatedTask] = await sql`
    UPDATE tasks
    SET
      title = COALESCE(${updates.title ?? null}, title),
      description = COALESCE(${updates.description ?? null}, description),
      category = COALESCE(${updates.category ?? null}, category),
      priority = COALESCE(${updates.priority ?? null}, priority),
      status = COALESCE(${updates.status ?? null}, status),
      assigned_to = COALESCE(${updates.assigned_to ?? null}, assigned_to),
      due_date = COALESCE(${updates.due_date ?? null}, due_date),
      updated_at = now()
    WHERE id = ${id}
    RETURNING *
  `;

  await sql`
    INSERT INTO task_history (task_id, action, old_value, new_value)
    VALUES (
      ${id},
      'updated',
      ${sql.json(oldTask)},
      ${sql.json(updatedTask)}
    )
  `;

  return updatedTask;
});
fastify.delete('/api/tasks/:id', async (req: any, reply: any) => {
  const { id } = req.params;

  const [task] = await sql`
    SELECT * FROM tasks WHERE id = ${id}
  `;

  if (!task) {
    return reply.status(404).send({ error: 'Task not found' });
  }

  await sql`
    INSERT INTO task_history (task_id, action, old_value)
    VALUES (${id}, 'deleted', ${sql.json(task)})
  `;

  await sql`
    DELETE FROM tasks WHERE id = ${id}
  `;

  return { success: true };
});
}