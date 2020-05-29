
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;


class LEDRepository {
  http.Client _httpClient;
  static const baseURL = kIsWeb ? "http://localhost:5000" : "http:/<domain_here>"; //TODO: update once testing is complete

  LEDRepository([this._httpClient]) {
    if (this._httpClient == null) {
      this._httpClient = http.Client();
    }
  }

  Future<void> getData([bool forceUpdate = false]) async {
    throw Exception('Not implemented yet');
  }
}