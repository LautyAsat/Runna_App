import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider((ref) => Dio(
  BaseOptions(
    baseUrl: "http://192.168.1.7:8080/api/v1",
    connectTimeout: const Duration(seconds: 5),
  )
));