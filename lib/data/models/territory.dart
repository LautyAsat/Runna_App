import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:runna/data/models/team.dart';

part 'territory.freezed.dart';
part 'territory.g.dart';

@freezed
class Territory with _$Territory {
  const factory Territory({
    required int id,
    required int userId,
    required int sourceActivityId,
    required DateTime conqueredAt,
    required List<List<List<double>>> area,
    required Team team,
  }) = _Territory;

  factory Territory.fromJson(Map<String, dynamic> json) => _$TerritoryFromJson(json);
}

extension TerritoryX on Territory {
  List<List<LatLng>> get polygons {
    if (area.isEmpty) return [];

    return area.map((polygonRing) {
      return polygonRing.map((point) {
        return LatLng(point[1], point[0]); 
      }).toList();
    }).toList();
  }
}