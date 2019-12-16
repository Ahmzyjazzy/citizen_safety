import 'dart:async';
import 'dart:convert';

import 'package:citizen_safety/models/response.dart';
import 'package:citizen_safety/utilities/swift.dart';
import 'package:http/http.dart' as http;

Future<ResponseData> loginUser(String email, String password) async {
  Map<String, dynamic> body = {
    'data': json.encode(
      {'USER_NAME': email, 'PASSWORD': password, "AUTH_TYPE": "LOGIN"},
    ),
    'actionType': 'LOGIN SELECT',
    'sessionId': '0',
  };

  print('Post data:=> $body');

  String url = '${Swift.apiUrl}/login';

  print('Post url:=> $url');

  final response = await http.post(
    url,
    body: body,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName("utf-8"),
  );

  print('Post response status:=> ${response.statusCode}');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ResponseData.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    print('Error:=> Bad request');
  }
  if (response.statusCode == 415) {
    print('Error:=> Unsupported format');
  }
  // If that call was not successful, throw an error.
  // throw Exception('Failed to load');
  print('Post response error:=> $response');
  return null;
}

Future<ResponseData> resetPassword(String email) async {
  Map<String, dynamic> body = {
    'data': json.encode(
      {'EMAIL': email, "AUTH_TYPE": "PASSWORD RESET'"},
    ),
    'actionType': 'PASSWORD RESET',
    'sessionId': '0',
  };

  print('Post data:=> $body');

  String url = '${Swift.apiUrl}/login';

  print(url);

  final response = await http.post(
    url,
    body: body,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName("utf-8"),
  );

  print(response.statusCode);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ResponseData.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    print('Error:=> Bad request');
  }
  if (response.statusCode == 415) {
    print('Error:=> Unsupported format');
  }
  // If that call was not successful, throw an error.
  // throw Exception('Failed to load');
  return null;
}

Future<ResponseData> changePassword(String email, String password) async {
  Map<String, dynamic> body = {
    'data': json.encode(
      {'EMAIL': email, 'PT_PASSWORD': password, "AUTH_TYPE": "PASSWORD RENEW"},
    ),
    'actionType': 'PASSWORD RENEW',
    'sessionId': '0',
  };

  String url = '${Swift.apiUrl}/login';

  final response = await http.post(
    url,
    body: body,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    },
    encoding: Encoding.getByName("utf-8"),
  );

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return ResponseData.fromJson(json.decode(response.body));
  }
  if (response.statusCode == 400) {
    print('Error:=> Bad request');
  }
  if (response.statusCode == 415) {
    print('Error:=> Unsupported format');
  }
  // If that call was not successful, throw an error.
  // throw Exception('Failed to load');
  return null;
}
