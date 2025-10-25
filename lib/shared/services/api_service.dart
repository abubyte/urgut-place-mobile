import 'package:dio/dio.dart';
import 'package:shops/core/utils/dio_logger.dart';
import 'package:shops/core/errors/api_exception.dart';

class ApiService {
  // Constructor
  ApiService();

  // Dio instance
  late Dio _dio;

  // Configuration Function
  void configureDio({
    required String baseUrl,
    Map<String, dynamic>? defaultHeaders,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    void Function(RequestOptions options, RequestInterceptorHandler handler)? onRequest,
    void Function(Response response, ResponseInterceptorHandler handler)? onResponse,
    void Function(DioException e, ErrorInterceptorHandler handler)? onError,
  }) {
    /// Create Dio instance with Base Options
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? const Duration(seconds: 30),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
      ),
    );

    // Adding interceptors
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            onRequest ??
            (options, handler) async {
              return handler.next(options);
            },
        onResponse:
            onResponse ??
            (response, handler) {
              return handler.next(response);
            },
        onError:
            onError ??
            (DioException e, handler) {
              return handler.next(e);
            },
      ),

      /// Logger Configuration
      PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, responseBody: true),
    ]);
  }

  // Get Request
  Future<Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    int? id,
  }) async {
    try {
      final response = await _dio.get(
        endpoint + ((id != null) ? '/$id' : ''),
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Post Request
  Future<Response> postRequest(String endpoint, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(endpoint, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Post FormData Request
  Future<Response> postFormDataRequest(
    String path, {
    required FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(path, data: formData, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Post FormData Request
  Future<Response> putFormDataRequest(
    String path, {
    required FormData? formData,
    Map<String, dynamic>? queryParameters,
    int? id,
  }) async {
    try {
      final response = await _dio.put(id != null ? '$path/$id' : path, data: formData, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Delete Request
  Future<Response> deleteRequest(String endpoint, int id, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete('$endpoint/$id', data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Patch Request
  Future<Response> patchRequest(String endpoint, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.patch(endpoint, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  // Put Request
  Future<Response> putRequest(String endpoint, {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(endpoint, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _mapDioError(e);
    } catch (e) {
      throw ApiException("Noma'lum xato yuz berdi");
    }
  }

  ApiException _mapDioError(DioException e) {
  // Default message (Uzbek)
  String message = "Tarmoqda xatolik yuz berdi. Iltimos, internet ulanishingizni tekshiring.";

    // Timeout
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
  message = "So'rov vaqti tugadi. Iltimos, keyinroq qayta urinib ko'ring.";
      return ApiException(message);
    }

    // No internet / socket issues
    if (e.type == DioExceptionType.unknown) {
      // Check for underlying socket exception message
      final err = e.error;
      if (err != null && err.toString().contains('SocketException')) {
  message = "Internetga ulanganingizni tekshiring.";
        return ApiException(message);
      }
    }

    // HTTP errors with status code
    final response = e.response;
    if (response != null) {
      final statusCode = response.statusCode;
      // Server errors
      if (statusCode != null && statusCode >= 500) {
  message = "Serverda xatolik yuz berdi. Iltimos, keyinroq qayta urinib ko'ring.";
        return ApiException(message, statusCode: statusCode);
      }

      // Client errors - show friendly messages for common statuses
      if (statusCode == 401) {
  message = "Avtorizatsiya talab qilinadi. Iltimos, tizimga kiring.";
        return ApiException(message, statusCode: statusCode);
      }

      if (statusCode == 404) {
  message = "Ma'lumot topilmadi.";
        return ApiException(message, statusCode: statusCode);
      }

      if (statusCode == 400) {
  message = "Yaroqsiz so'rov. Iltimos, ma'lumotlarni tekshiring.";
        return ApiException(message, statusCode: statusCode);
      }

      // Try to map message from response body if available
      try {
        final data = response.data;
        if (data is Map && data['message'] != null && data['message'] is String) {
          message = data['message'];
        }
      } catch (_) {
        // ignore parsing issues
      }

      return ApiException(message, statusCode: statusCode);
    }

    // Fallback
    return ApiException(message);
  }
}
