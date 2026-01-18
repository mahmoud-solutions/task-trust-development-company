import 'dart:convert';

Map<String, dynamic> handleResponse(dynamic data) {
  if (data is Map<String, dynamic>) {
    return data;
  }

  if (data is String) {
    if (data.trim().startsWith('<!DOCTYPE html')) {
      throw Exception(
        'Server returned HTML instead of JSON (check endpoint or auth)',
      );
    }
    return jsonDecode(data) as Map<String, dynamic>;
  }

  throw Exception('Unexpected response type: ${data.runtimeType}');
}
