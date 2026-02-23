import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:runna/core/network/api_client.dart';
import 'package:runna/data/models/territory.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/state/home_state.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    // Auto-inicialización: cargamos territorios al crear el provider
    
    return const HomeState.success([]);
    // Future.microtask(() => fetchTerritories());
    // return const HomeState.loading();
  }

  Future<void> fetchTerritories() async {
    state = const HomeState.loading();

    final dio = ref.read(apiClientProvider);
    final authState = ref.read(authNotifierProvider);

    final username = authState.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    if (username == null) {
      return;
    }

    try {
      final response = await dio.get('/territories');

      final List<dynamic> rawList = response.data;

      final List<Territory> territories = rawList
          .map((json) => Territory.fromJson(json))
          .toList();

      state = HomeState.success(territories);
    } on DioException catch (e) {
      state = HomeState.error('Failed to load territories: ${e.message}');
    } catch (e) {
      state = HomeState.error('Failed to load territories: $e');
    }
  }
}
