import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String _baseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.1.7:8080/api/v1',
);

final apiClientProvider = Provider(
  (ref) => Dio(
    BaseOptions(baseUrl: _baseUrl, connectTimeout: const Duration(seconds: 5)),
  ),
);
