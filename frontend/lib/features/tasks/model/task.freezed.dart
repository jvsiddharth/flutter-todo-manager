// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get assigned_to => throw _privateConstructorUsedError;
  DateTime? get due_date => throw _privateConstructorUsedError;
  List<String>? get extracted_entities => throw _privateConstructorUsedError;
  List<String>? get suggested_actions => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  DateTime get updated_at => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String category,
    String priority,
    String status,
    String? assigned_to,
    DateTime? due_date,
    List<String>? extracted_entities,
    List<String>? suggested_actions,
    DateTime created_at,
    DateTime updated_at,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? status = null,
    Object? assigned_to = freezed,
    Object? due_date = freezed,
    Object? extracted_entities = freezed,
    Object? suggested_actions = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            assigned_to: freezed == assigned_to
                ? _value.assigned_to
                : assigned_to // ignore: cast_nullable_to_non_nullable
                      as String?,
            due_date: freezed == due_date
                ? _value.due_date
                : due_date // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            extracted_entities: freezed == extracted_entities
                ? _value.extracted_entities
                : extracted_entities // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            suggested_actions: freezed == suggested_actions
                ? _value.suggested_actions
                : suggested_actions // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            created_at: null == created_at
                ? _value.created_at
                : created_at // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updated_at: null == updated_at
                ? _value.updated_at
                : updated_at // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String category,
    String priority,
    String status,
    String? assigned_to,
    DateTime? due_date,
    List<String>? extracted_entities,
    List<String>? suggested_actions,
    DateTime created_at,
    DateTime updated_at,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? category = null,
    Object? priority = null,
    Object? status = null,
    Object? assigned_to = freezed,
    Object? due_date = freezed,
    Object? extracted_entities = freezed,
    Object? suggested_actions = freezed,
    Object? created_at = null,
    Object? updated_at = null,
  }) {
    return _then(
      _$TaskImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        assigned_to: freezed == assigned_to
            ? _value.assigned_to
            : assigned_to // ignore: cast_nullable_to_non_nullable
                  as String?,
        due_date: freezed == due_date
            ? _value.due_date
            : due_date // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        extracted_entities: freezed == extracted_entities
            ? _value._extracted_entities
            : extracted_entities // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        suggested_actions: freezed == suggested_actions
            ? _value._suggested_actions
            : suggested_actions // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        created_at: null == created_at
            ? _value.created_at
            : created_at // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updated_at: null == updated_at
            ? _value.updated_at
            : updated_at // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.status,
    this.assigned_to,
    this.due_date,
    final List<String>? extracted_entities,
    final List<String>? suggested_actions,
    required this.created_at,
    required this.updated_at,
  }) : _extracted_entities = extracted_entities,
       _suggested_actions = suggested_actions;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String category;
  @override
  final String priority;
  @override
  final String status;
  @override
  final String? assigned_to;
  @override
  final DateTime? due_date;
  final List<String>? _extracted_entities;
  @override
  List<String>? get extracted_entities {
    final value = _extracted_entities;
    if (value == null) return null;
    if (_extracted_entities is EqualUnmodifiableListView)
      return _extracted_entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _suggested_actions;
  @override
  List<String>? get suggested_actions {
    final value = _suggested_actions;
    if (value == null) return null;
    if (_suggested_actions is EqualUnmodifiableListView)
      return _suggested_actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime created_at;
  @override
  final DateTime updated_at;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, category: $category, priority: $priority, status: $status, assigned_to: $assigned_to, due_date: $due_date, extracted_entities: $extracted_entities, suggested_actions: $suggested_actions, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assigned_to, assigned_to) ||
                other.assigned_to == assigned_to) &&
            (identical(other.due_date, due_date) ||
                other.due_date == due_date) &&
            const DeepCollectionEquality().equals(
              other._extracted_entities,
              _extracted_entities,
            ) &&
            const DeepCollectionEquality().equals(
              other._suggested_actions,
              _suggested_actions,
            ) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    category,
    priority,
    status,
    assigned_to,
    due_date,
    const DeepCollectionEquality().hash(_extracted_entities),
    const DeepCollectionEquality().hash(_suggested_actions),
    created_at,
    updated_at,
  );

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    required final String id,
    required final String title,
    required final String description,
    required final String category,
    required final String priority,
    required final String status,
    final String? assigned_to,
    final DateTime? due_date,
    final List<String>? extracted_entities,
    final List<String>? suggested_actions,
    required final DateTime created_at,
    required final DateTime updated_at,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get category;
  @override
  String get priority;
  @override
  String get status;
  @override
  String? get assigned_to;
  @override
  DateTime? get due_date;
  @override
  List<String>? get extracted_entities;
  @override
  List<String>? get suggested_actions;
  @override
  DateTime get created_at;
  @override
  DateTime get updated_at;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
