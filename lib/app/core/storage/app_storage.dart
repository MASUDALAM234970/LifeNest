import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../conts/endpoints.dart';

class ApiService {
  static const _storage = FlutterSecureStorage();

  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  /// Save Tokens
  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: _accessKey, value: access);
    await _storage.write(key: _refreshKey, value: refresh);
  }

  /// Access Token
  Future<String?> get accessToken async {
    return await _storage.read(key: _accessKey);
  }

  /// Refresh Token
  Future<String?> get _refreshToken async {
    return await _storage.read(key: _refreshKey);
  }

  /// Login Check
  Future<bool> get isLoggedIn async {
    return (await accessToken) != null;
  }

  /// Logout
  Future<void> logout() async {
    await _storage.delete(key: _accessKey);
    await _storage.delete(key: _refreshKey);
  }

  /// Common Headers
  Future<Map<String, String>> _headers({bool auth = true}) async {
    final headers = <String, String>{'Content-Type': 'application/json'};

    if (auth) {
      final token = await accessToken;
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  /// Refresh Access Token
  Future<bool> _tryRefresh() async {
    final refresh = await _refreshToken;

    if (refresh == null) return false;

    final response = await http.post(
      Uri.parse(Endpoints.tokenRefresh),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh': refresh}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      await _storage.write(key: _accessKey, value: data['access']);

      return true;
    }

    return false;
  }

  /// GET
  Future<http.Response> get(String url) async {
    var response = await http.get(Uri.parse(url), headers: await _headers());

    if (response.statusCode == 401 && await _tryRefresh()) {
      response = await http.get(Uri.parse(url), headers: await _headers());
    }

    return response;
  }

  /// POST
  Future<http.Response> post(
    String url,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    var response = await http.post(
      Uri.parse(url),
      headers: await _headers(auth: auth),
      body: jsonEncode(body),
    );

    if (auth && response.statusCode == 401 && await _tryRefresh()) {
      response = await http.post(
        Uri.parse(url),
        headers: await _headers(),
        body: jsonEncode(body),
      );
    }

    return response;
  }

  /// PATCH
  Future<http.Response> patch(String url, Map<String, dynamic> body) async {
    var response = await http.patch(
      Uri.parse(url),
      headers: await _headers(),
      body: jsonEncode(body),
    );

    if (response.statusCode == 401 && await _tryRefresh()) {
      response = await http.patch(
        Uri.parse(url),
        headers: await _headers(),
        body: jsonEncode(body),
      );
    }

    return response;
  }
}
