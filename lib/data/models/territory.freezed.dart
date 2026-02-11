// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'territory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Territory _$TerritoryFromJson(Map<String, dynamic> json) {
  return _Territory.fromJson(json);
}

/// @nodoc
mixin _$Territory {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get sourceActivityId => throw _privateConstructorUsedError;
  DateTime get conqueredAt => throw _privateConstructorUsedError;
  List<List<List<double>>> get area => throw _privateConstructorUsedError;
  Team get team => throw _privateConstructorUsedError;

  /// Serializes this Territory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Territory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TerritoryCopyWith<Territory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TerritoryCopyWith<$Res> {
  factory $TerritoryCopyWith(Territory value, $Res Function(Territory) then) =
      _$TerritoryCopyWithImpl<$Res, Territory>;
  @useResult
  $Res call({
    int id,
    int userId,
    int sourceActivityId,
    DateTime conqueredAt,
    List<List<List<double>>> area,
    Team team,
  });
}

/// @nodoc
class _$TerritoryCopyWithImpl<$Res, $Val extends Territory>
    implements $TerritoryCopyWith<$Res> {
  _$TerritoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Territory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sourceActivityId = null,
    Object? conqueredAt = null,
    Object? area = null,
    Object? team = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            sourceActivityId: null == sourceActivityId
                ? _value.sourceActivityId
                : sourceActivityId // ignore: cast_nullable_to_non_nullable
                      as int,
            conqueredAt: null == conqueredAt
                ? _value.conqueredAt
                : conqueredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            area: null == area
                ? _value.area
                : area // ignore: cast_nullable_to_non_nullable
                      as List<List<List<double>>>,
            team: null == team
                ? _value.team
                : team // ignore: cast_nullable_to_non_nullable
                      as Team,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TerritoryImplCopyWith<$Res>
    implements $TerritoryCopyWith<$Res> {
  factory _$$TerritoryImplCopyWith(
    _$TerritoryImpl value,
    $Res Function(_$TerritoryImpl) then,
  ) = __$$TerritoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    int sourceActivityId,
    DateTime conqueredAt,
    List<List<List<double>>> area,
    Team team,
  });
}

/// @nodoc
class __$$TerritoryImplCopyWithImpl<$Res>
    extends _$TerritoryCopyWithImpl<$Res, _$TerritoryImpl>
    implements _$$TerritoryImplCopyWith<$Res> {
  __$$TerritoryImplCopyWithImpl(
    _$TerritoryImpl _value,
    $Res Function(_$TerritoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Territory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? sourceActivityId = null,
    Object? conqueredAt = null,
    Object? area = null,
    Object? team = null,
  }) {
    return _then(
      _$TerritoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        sourceActivityId: null == sourceActivityId
            ? _value.sourceActivityId
            : sourceActivityId // ignore: cast_nullable_to_non_nullable
                  as int,
        conqueredAt: null == conqueredAt
            ? _value.conqueredAt
            : conqueredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        area: null == area
            ? _value._area
            : area // ignore: cast_nullable_to_non_nullable
                  as List<List<List<double>>>,
        team: null == team
            ? _value.team
            : team // ignore: cast_nullable_to_non_nullable
                  as Team,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TerritoryImpl implements _Territory {
  const _$TerritoryImpl({
    required this.id,
    required this.userId,
    required this.sourceActivityId,
    required this.conqueredAt,
    required final List<List<List<double>>> area,
    required this.team,
  }) : _area = area;

  factory _$TerritoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TerritoryImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int sourceActivityId;
  @override
  final DateTime conqueredAt;
  final List<List<List<double>>> _area;
  @override
  List<List<List<double>>> get area {
    if (_area is EqualUnmodifiableListView) return _area;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_area);
  }

  @override
  final Team team;

  @override
  String toString() {
    return 'Territory(id: $id, userId: $userId, sourceActivityId: $sourceActivityId, conqueredAt: $conqueredAt, area: $area, team: $team)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerritoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sourceActivityId, sourceActivityId) ||
                other.sourceActivityId == sourceActivityId) &&
            (identical(other.conqueredAt, conqueredAt) ||
                other.conqueredAt == conqueredAt) &&
            const DeepCollectionEquality().equals(other._area, _area) &&
            (identical(other.team, team) || other.team == team));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    sourceActivityId,
    conqueredAt,
    const DeepCollectionEquality().hash(_area),
    team,
  );

  /// Create a copy of Territory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TerritoryImplCopyWith<_$TerritoryImpl> get copyWith =>
      __$$TerritoryImplCopyWithImpl<_$TerritoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TerritoryImplToJson(this);
  }
}

abstract class _Territory implements Territory {
  const factory _Territory({
    required final int id,
    required final int userId,
    required final int sourceActivityId,
    required final DateTime conqueredAt,
    required final List<List<List<double>>> area,
    required final Team team,
  }) = _$TerritoryImpl;

  factory _Territory.fromJson(Map<String, dynamic> json) =
      _$TerritoryImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get sourceActivityId;
  @override
  DateTime get conqueredAt;
  @override
  List<List<List<double>>> get area;
  @override
  Team get team;

  /// Create a copy of Territory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TerritoryImplCopyWith<_$TerritoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
