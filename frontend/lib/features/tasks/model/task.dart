import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required String description,
    required String category,
    required String priority,
    required String status,
    String? assigned_to,
    DateTime? due_date,
    List<String>? extracted_entities,
    List<String>? suggested_actions,
    required DateTime created_at,
    required DateTime updated_at,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) =>
      _$TaskFromJson(json);
}
