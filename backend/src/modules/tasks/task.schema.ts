import { z } from 'zod';

export const CreateTaskSchema = z.object({
  title: z.string().min(3),
  description: z.string().min(5),
  assigned_to: z.string().optional(),
  due_date: z.string().optional()
});
