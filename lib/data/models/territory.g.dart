// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TerritoryImpl _$$TerritoryImplFromJson(Map<String, dynamic> json) =>
    _$TerritoryImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      sourceActivityId: (json['sourceActivityId'] as num).toInt(),
      conqueredAt: DateTime.parse(json['conqueredAt'] as String),
      area: (json['area'] as List<dynamic>)
          .map(
            (e) => (e as List<dynamic>)
                .map(
                  (e) => (e as List<dynamic>)
                      .map((e) => (e as num).toDouble())
                      .toList(),
                )
                .toList(),
          )
          .toList(),
      team: $enumDecode(_$TeamEnumMap, json['team']),
    );

Map<String, dynamic> _$$TerritoryImplToJson(_$TerritoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'sourceActivityId': instance.sourceActivityId,
      'conqueredAt': instance.conqueredAt.toIso8601String(),
      'area': instance.area,
      'team': _$TeamEnumMap[instance.team]!,
    };

const _$TeamEnumMap = {
  Team.red: 'RED',
  Team.blue: 'BLUE',
  Team.green: 'GREEN',
  Team.yellow: 'YELLOW',
};
