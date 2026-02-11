import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:runna/data/models/territory.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.noTeam() = _NoTeam;
  const factory HomeState.success(List<Territory> territories) = _Success;
  const factory HomeState.error(String message) = _Error;  
}