import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  Dio _dio;
  static String ipAddress = dotenv.env['IP_ADDRESS']!;
  final String baseUrl = 'http://$ipAddress/task_management/';

  ApiServices(this._dio) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      compact: false,
    ));
  }

  // POST Request
  Future<Map<String, dynamic>> post(
    String endPoint, {
    required Map<String, dynamic> data,
  }) async {
    try {
      _dio.options.headers = {'Content-Type': 'application/json'};
      final response = await _dio.post(endPoint, data: data);

      log("Response data type: ${response.data.runtimeType}");
      log("Raw response: ${response.data}");

      // Handle response
      if (response.data is String) {
        return jsonDecode(response.data);
      } else if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw Exception(
            "Unexpected response type: ${response.data.runtimeType}");
      }
    } on DioException catch (e) {
      final errorData = _handleError(e);
      throw ApiException(errorData['error']); // Throw a custom ApiException
    } catch (e) {
      log("Error: $e");
      throw ApiException("An unexpected error occurred: ${e.toString()}");
    }
  }

// Centralized Error Handling
  Map<String, dynamic> _handleError(DioException e) {
    if (e.type == DioExceptionType.badResponse && e.response != null) {
      return {
        'error': e.response?.data['error'] ?? 'Server error occurred',
      };
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return {'error': 'Connection timeout. Please try again.'};
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return {'error': 'Receive timeout. Check your connection.'};
    } else if (e.type == DioExceptionType.connectionError) {
      return {'error': 'No internet connection.'};
    } else {
      return {'error': 'Unexpected error: ${e.message}'};
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
