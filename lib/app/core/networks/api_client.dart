import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../conts/apiexception.dart';
import '../conts/endpoints.dart';

class ApiClient {
  ApiClient._internal();

  static final ApiClient instance = ApiClient._internal();

  final http.Client _client = http.Client();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const _accessKey = "access_token";
  static const _refreshKey = "refresh_token";

  final Map<String, String> _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  Future<void> clearTokens() async {
    await _storage.delete(key: _accessKey);
    await _storage.delete(key: _refreshKey);
  }

  Future<String?> get accessToken async {
    return await _storage.read(key: _accessKey);
  }

  Future<String?> get refreshToken async {
    return await _storage.read(key: _refreshKey);
  }

  Future<Map<String, String>> _buildHeaders({
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final map = {..._headers};

    if (headers != null) {
      map.addAll(headers);
    }

    if (auth) {
      final token = await accessToken;

      if (token != null && token.isNotEmpty) {
        map["Authorization"] = "Bearer $token";
      }
    }

    return map;
  }

  Future<dynamic> get(
    String endpoint, {
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final response = await _client
        .get(
          Uri.parse("${Endpoints.baseUrl}$endpoint"),
          headers: await _buildHeaders(auth: auth, headers: headers),
        )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  Future<dynamic> post(
    String endpoint, {
    dynamic body,
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final response = await _client
        .post(
          Uri.parse("${Endpoints.baseUrl}$endpoint"),
          headers: await _buildHeaders(auth: auth, headers: headers),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  Future<dynamic> put(
    String endpoint, {
    dynamic body,
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final response = await _client
        .put(
          Uri.parse("${Endpoints.baseUrl}$endpoint"),
          headers: await _buildHeaders(auth: auth, headers: headers),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  Future<dynamic> putMultipart(
    String endpoint, {
    required Map<String, String> fields,
    String? filePath,
    String fileField = "profile_picture",
    bool auth = true,
  }) async {
    try {
      final request = http.MultipartRequest(
        "PUT",
        Uri.parse("${Endpoints.baseUrl}$endpoint"),
      );

      // Headers
      request.headers["Accept"] = "application/json";

      if (auth) {
        final token = await accessToken;

        if (token != null && token.isNotEmpty) {
          request.headers["Authorization"] = "Bearer $token";
        }
      }

      // Text fields
      request.fields.addAll(fields);

      // Image
      if (filePath != null && filePath.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath(fileField, filePath),
        );
      }

      final streamedResponse = await request.send().timeout(
        const Duration(seconds: 30),
      );

      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse(response);
    } catch (e) {
      print("Multipart PUT Error: $e");
      rethrow;
    }
  }

  Future<dynamic> patch(
    String endpoint, {
    dynamic body,
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final response = await _client
        .patch(
          Uri.parse("${Endpoints.baseUrl}$endpoint"),
          headers: await _buildHeaders(auth: auth, headers: headers),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  Future<dynamic> delete(
    String endpoint, {
    dynamic body,
    bool auth = true,
    Map<String, String>? headers,
  }) async {
    final response = await _client
        .delete(
          Uri.parse("${Endpoints.baseUrl}$endpoint"),
          headers: await _buildHeaders(auth: auth, headers: headers),
          body: jsonEncode(body),
        )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    final body = response.body.isEmpty ? {} : jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return body;

      case 400:
      case 401:
      case 403:
      case 404:
      case 500:
      default:
        throw ApiException(
          message: _extractErrorMessage(body),
          statusCode: response.statusCode,
        );
    }
  }

  /// Extract error message from API response
  String _extractErrorMessage(dynamic body) {
    if (body == null) {
      return "Something went wrong";
    }

    if (body is String) {
      return body;
    }

    if (body is Map<String, dynamic>) {
      // ✅ First check validation errors
      if (body["errors"] != null && body["errors"] is Map<String, dynamic>) {
        final Map<String, dynamic> errors = body["errors"];

        final List<String> messages = [];

        errors.forEach((key, value) {
          if (value is List) {
            messages.addAll(value.map((e) => e.toString()));
          } else {
            messages.add(value.toString());
          }
        });

        if (messages.isNotEmpty) {
          return messages.join("\n");
        }
      }

      // Then check common message fields
      if (body["message"] != null) {
        return body["message"].toString();
      }

      if (body["detail"] != null) {
        return body["detail"].toString();
      }

      if (body["error"] != null) {
        return body["error"].toString();
      }
    }

    return "Something went wrong";
  }
}
