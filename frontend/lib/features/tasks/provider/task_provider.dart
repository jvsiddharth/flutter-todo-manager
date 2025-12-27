import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/api/api_client.dart';
import '../model/task.dart';

/// 🔹 LIST TASKS
final taskListProvider = FutureProvider<List<Task>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/api/tasks');

  return (response.data as List)
      .map((json) => Task.fromJson(json))
      .toList();
});

/// 🔹 PREVIEW CLASSIFICATION
final taskPreviewProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, String>>(
        (ref, input) async {
  final dio = ref.read(dioProvider);

  final res = await dio.post(
    '/api/tasks/preview',
    data: {
      'title': input['title'],
      'description': input['description'],
    },
  );

  return Map<String, dynamic>.from(res.data);
});

/// 🔹 CREATE TASK
final createTaskProvider =
    FutureProvider.family<void, Map<String, dynamic>>((ref, payload) async {
  final dio = ref.read(dioProvider);

  await dio.post('/api/tasks', data: payload);

  // refresh list after create
  ref.invalidate(taskListProvider);
});
