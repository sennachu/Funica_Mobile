import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  //SECURE STORAGE PAKETİ LOGİN BİLGİLERİNİ KAYDETTİKTEN SONRA CONSOLEDA YAZIYOR APP İÇİNDE SHARED PREF KULLANDIK AYNI İŞLEVİ GÖRÜYOR
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    String value = await storage.read(key: key) ?? "Data is not found!";
    print('Data read from secure storage: $value');
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}
