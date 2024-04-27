import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Uygulama için güvenli veri depolama işlemlerini yöneten sınıf
class SecureStorage {
  // FlutterSecureStorage nesnesi oluşturulur
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // Veri depolamak için kullanılan fonksiyon
  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  // Veriyi okumak için kullanılan fonksiyon
  readSecureData(String key) async {
    // Veriyi okurken ekrana yazdırılır
    String value = await storage.read(key: key) ?? "Data is not found!";
    print('Data read from secure storage: $value');
  }

  // Veriyi silmek için kullanılan fonksiyon
  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}