import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class CacheSystem {
  Future<Map<String, dynamic>> getOrdersConfig() async {
    if (kIsWeb) {
      final data = await loadJsonFromAssets("assets/static/orders.json");
      return data;
    }
    
    final cachedata = await loadJsonFromCache("orders.json");
    if (cachedata != null) {
      return cachedata;
    } else {
      final data = await loadJsonFromAssets("assets/static/orders.json");
      return data;
    }
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<Map<String, dynamic>?> loadJsonFromCache(String filePath) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final file = File("${appCacheDir.path}/$filePath");

    if (file.existsSync()) {
      final fileData = await file.readAsString();

      return jsonDecode(fileData);
    } else {
      return null;
    }
  }

  saveStringToCache(String filePath, String data) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();
    final file = File("${appCacheDir.path}/$filePath");
    await file.writeAsString(data, mode: FileMode.write);
  }

  saveMapToCache(String filePath, Map<String, dynamic> data) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();
    final file = File("${appCacheDir.path}/$filePath");
    await file.writeAsString(jsonEncode(data), mode: FileMode.write);
  }
}
