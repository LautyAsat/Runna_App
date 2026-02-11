import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:runna/core/network/api_client.dart';
import 'package:runna/data/models/territory.dart';
import 'package:runna/presentation/provider/auth_provider.dart';
import 'package:runna/presentation/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState>{
  
  final Ref ref;

  HomeNotifier(this.ref) : super(const HomeState.loading()){
    fetchTerritories();
  }

  Future<void> fetchTerritories() async {
    state = const HomeState.loading();

    final dio = ref.read(apiClientProvider);
    final auth = ref.read(authProvider);

    final authState = ref.read(authProvider);

    final username = authState.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null
    );

    if(username == null){
      return;
    }

    try{
      final response = await dio.get('/territories');

      final List<dynamic> rawList = response.data;

      final List<Territory> territories = rawList
        .map((json) => Territory.fromJson(json))
        .toList();

      state = HomeState.success(territories);
    } on DioException catch(e){
      print('DioException al cargar los territorios: ${e.message}');
      state = HomeState.error('Failed to load territories: ${e.message}');
    }
    catch(e){
      print('Error al cargar los territorios: $e');
      state = HomeState.error('Failed to load territories: $e');
    }
  }

}


final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(ref);
});