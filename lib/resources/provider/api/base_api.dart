import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/models/auth.dart';
import 'package:matakampus2/resources/provider/shared_preference.dart';

var header = {
  'content-type': 'application/json',
  'accept': 'application/json',
};

class BaseAPI {
  String baseURL;
  final prefs = locator<Preference>();

  BaseAPI() {
    baseURL = "http://192.168.1.9:3000";
  }

  Future<dynamic> doPost(String url, dynamic body, BuildContext context) async {
    final encodedURL = Uri.encodeFull('$baseURL/$url');
    print('doPost : $encodedURL $body');
    final header = getHeader();
    print('HEADER : $header');

    final response = await post(encodedURL, headers: header, body: json.encode(body));
    print('Got Response ? ${response.statusCode}');
    if (response.statusCode == StatusCode.success) {
      final result = json.decode(response.body);
      print('SUCCESS : $result');
      return result;
    } else {
      await handleError(response, context);
      return doPost(url, body, context);
    }
  }

  Future<dynamic> doPut(String url, Map<String, Object> body, BuildContext context) async {
    final encodedURL = Uri.encodeFull('$baseURL/$url');
    print('doPut : $encodedURL $body');
    final header = getHeader();
    print('HEADER : $header');

    final response = await put(encodedURL, headers: header, body: json.encode(body));
    print('Got Response ? ${response.statusCode}');
    if (response.statusCode == StatusCode.success) {
      final result = json.decode(response.body);
      print('SUCCESS : $result');
      return result;
    } else {
      await handleError(response, context);
      return doPut(url, body, context);
    }
  }

  Future<Map<String, dynamic>> doGet(String url, BuildContext context) async {
    final encodedURL = Uri.encodeFull('$baseURL/$url');
    print('doGet : $encodedURL');
    final header = getHeader();
    print('HEADER : $header');

    final response = await get(encodedURL, headers: header);
    print('Got Response ? ${response.statusCode}');
    if (response.statusCode == StatusCode.success) {
      final result = Map<String, dynamic>.from(json.decode(response.body));
      print('SUCCESS : $result');
      return result;
    } else {
      await handleError(response, context);
      return doGet(url, context);
    }
  }

  Map<String, String> getHeader() {
    var header = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };

    final token = prefs.getToken();
    if (token != null && token != '') {
      header['Authorization'] = token;
    }

    return header;
  }

  void saveAuthToPrefs(AuthToken token) async {
    await prefs.setToken(token.token);
  }

  Future<void> logout(BuildContext context) async {
    print('logout');
    await prefs.logout();
    if (context != null) {
      await Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> route) => false,
      );
    }
    return;
  }

  void handleError(dynamic response, BuildContext context) async {
    print('FAILED : ${response.statusCode} : ${response.body}');
    final result = json.decode(response.body);
    String errorMessage;
    if(result['error']){
      errorMessage = '${result['message']}';
        throw APIException(errorMessage);
    } 
  }
}

class StatusCode {
  static const int success = 200;
  static const int tokenExpired = 404;
  static const int unauthorized = 404;
}

class APIException implements Exception {
  final String message;

  const APIException(this.message);
  String toString() => message;
}
