import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../conts/ApiException.dart';
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
      headers: await _buildHeaders(
        auth: auth,
        headers: headers,
      ),
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
      headers: await _buildHeaders(
        auth: auth,
        headers: headers,
      ),
      body: jsonEncode(body),
    )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
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
      headers: await _buildHeaders(
        auth: auth,
        headers: headers,
      ),
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
      headers: await _buildHeaders(
        auth: auth,
        headers: headers,
      ),
      body: jsonEncode(body),
    )
        .timeout(const Duration(seconds: 30));

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final body = response.body.isEmpty ? {} : jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return body;

      case 400:
        throw ApiException(
          message: body["message"] ?? "Bad Request",
          statusCode: 400,
        );

      case 401:
        throw ApiException(
          message: body["message"] ?? "Unauthorized",
          statusCode: 401,
        );

      case 403:
        throw ApiException(
          message: body["message"] ?? "Forbidden",
          statusCode: 403,
        );

      case 404:
        throw ApiException(
          message: body["message"] ?? "Not Found",
          statusCode: 404,
        );

      case 500:
        throw ApiException(
          message: body["message"] ?? "Internal Server Error",
          statusCode: 500,
        );

      default:
        throw ApiException(
          message: body["message"] ?? "Something went wrong",
          statusCode: response.statusCode,
        );
    }
  }
}