import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../provider/task_provider.dart';
import '../model/task.dart';

class TaskDashboard extends ConsumerWidget {
  const TaskDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Task Manager'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => const _TaskFormSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: tasksAsync.when(
        loading: () => const _SkeletonLoader(),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (tasks) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(taskListProvider);
          },
          child: Column(
            children: [
              _SummaryCards(tasks: tasks),
              const Divider(height: 1),
              _TaskList(tasks: tasks),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────────────────── SUMMARY CARDS ───────────────────────── */

class _SummaryCards extends StatelessWidget {
  final List<Task> tasks;
  const _SummaryCards({required this.tasks});

  @override
  Widget build(BuildContext context) {
    int pending = tasks.where((t) => t.status == 'pending').length;
    int inProgress =
        tasks.where((t) => t.status == 'in_progress').length;
    int completed =
        tasks.where((t) => t.status == 'completed').length;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _StatusCard('Pending', pending, Colors.orange),
          _StatusCard('In Progress', inProgress, Colors.blue),
          _StatusCard('Completed', completed, Colors.green),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const _StatusCard(this.label, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

/* ───────────────────────── TASK LIST ───────────────────────── */

class _TaskList extends ConsumerWidget {
  final List<Task> tasks;
  const _TaskList({required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: tasks.length,
        itemBuilder: (_, i) {
          final task = tasks[i];
          return Card(
            child: ListTile(
              title: Text(task.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 6,
                    children: [
                      Chip(label: Text(task.category)),
                      Chip(
                        label: Text(task.priority),
                        backgroundColor:
                            task.priority == 'high'
                                ? Colors.red.shade100
                                : task.priority == 'medium'
                                    ? Colors.orange.shade100
                                    : Colors.green.shade100,
                      ),
                    ],
                  ),
                  if (task.due_date != null)
                    Text(
                      'Due: ${task.due_date!.toLocal().toString().split('.').first}',
                    ),
                ],
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (v) async {
                  final dio = ref.read(dioProvider);
                  if (v == 'delete') {
                    await dio.delete('/api/tasks/${task.id}');
                  } else {
                    await dio.patch(
                      '/api/tasks/${task.id}',
                      data: {'status': v},
                    );
                  }
                  ref.invalidate(taskListProvider);
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: 'pending',
                    child: Text('Mark Pending'),
                  ),
                  PopupMenuItem(
                    value: 'in_progress',
                    child: Text('Mark In Progress'),
                  ),
                  PopupMenuItem(
                    value: 'completed',
                    child: Text('Mark Completed'),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/* ───────────────────────── BOTTOM SHEET FORM ───────────────────────── */

class _TaskFormSheet extends ConsumerStatefulWidget {
  const _TaskFormSheet();

  @override
  ConsumerState<_TaskFormSheet> createState() =>
      _TaskFormSheetState();
}

class _TaskFormSheetState
    extends ConsumerState<_TaskFormSheet> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  final _assignedCtrl = TextEditingController();
  DateTime? _dueDate;

  bool get _valid =>
      _titleCtrl.text.isNotEmpty &&
      _descCtrl.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create Task',
              style:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(labelText: 'Title'),
              onChanged: (_) => setState(() {}),
            ),
            TextField(
              controller: _descCtrl,
              decoration:
                  const InputDecoration(labelText: 'Description'),
              maxLines: 3,
              onChanged: (_) => setState(() {}),
            ),
            TextField(
              controller: _assignedCtrl,
              decoration:
                  const InputDecoration(labelText: 'Assigned To'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dueDate == null
                        ? 'No due date'
                        : 'Due: ${_dueDate!.toLocal().toString().split('.').first}',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      initialDate: DateTime.now(),
                    );
                    if (date == null) return;
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time == null) return;
                    setState(() {
                      _dueDate = DateTime(
                        date.year,
                        date.month,
                        date.day,
                        time.hour,
                        time.minute,
                      );
                    });
                  },
                  child: const Text('Pick Due Date'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _valid
                    ? () async {
                        await ref.read(
                          createTaskProvider({
                            'title': _titleCtrl.text,
                            'description': _descCtrl.text,
                            'assigned_to': _assignedCtrl.text,
                            'due_date':
                                _dueDate?.toIso8601String(),
                          }).future,
                        );
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text('Create Task'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ───────────────────────── LOADING STATE ───────────────────────── */

class _SkeletonLoader extends StatelessWidget {
  const _SkeletonLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
