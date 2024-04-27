import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:funica_mobile/model/credit_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Uygulama için veri depolama işlemlerini yöneten sınıf
class Storage {
  // Uygulama ilk açıldığında yapılacak işlemleri yöneten fonksiyon
  Future<bool> isFirstLaunch() async {
    // SharedPreferences nesnesi oluşturulur
    final SharedPreferences storage = await SharedPreferences.getInstance();

    // Uygulama ilk açıldığında "runned" anahtarına sahip bir değer var mı kontrol edilir
    final runned = storage.getBool("runned");

    // Uygulama ilk açıldığında "launchCount" anahtarına sahip bir değer var mı kontrol edilir
    var counter = storage.getInt("launchCount");

    // Eğer "runned" anahtarı yoksa, uygulama ilk açıldığındır ve "launchCount" anahtarına 1 değeri atanır
    if (runned == null) {
      counter = 1;
      await storage.setInt("launchCount", 1);
      return true;
    } else {
      // Eğer "runned" anahtarı varsa, uygulama önceki bir kez açıldı ve "launchCount" anahtarına 1 artırılır
      counter ??= 0;
      await storage.setInt("launchCount", counter + 1);
      return false;
    }
  }

  // Uygulama ilk açıldığında "runned" anahtarına true değeri atanan fonksiyon
  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  // Uygulama için dil ve kararlı mod seçeneklerini depolamak için kullanılan fonksiyon
  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    // Eğer "language" parametresi varsa, "language" anahtarına değer atanır
    if (language != null) {
      await storage.setString("language", language);
    }

    // Eğer "darkMode" parametresi varsa, "darkMode" anahtarına değer atanır
    if (darkMode != null) {
      await storage.setBool("darkMode", darkMode);
    }
  }

  // Uygulama için dil ve kararlı mod seçeneklerini almak için kullanılan fonksiyon
  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    // "language" ve "darkMode" anahtarlarına sahip değerler alınır
    return {
      "language": storage.getString("language"),
      "darkMode": storage.getBool("darkMode"),
    };
  }

  // Ödeme kartlarını depolamak için kullanılan fonksiyon
  Future<List<PaymentCard>> loadCards() async {
    // FlutterSecureStorage nesnesi oluşturulur
    const storage = FlutterSecureStorage();

    // "paymentCards" anahtarına sahip değerler alınır
    final cards = await storage.read(key: "paymentCards");

    // Eğer "paymentCards" anahtarına sahip değerler varsa, JSON formatında işlenir ve PaymentCard nesneleri oluşturulur
    if (cards != null) {
      final temp = jsonDecode(cards);
      List<PaymentCard> cardList = [];
      for (var i = 0; i < temp.length; i++) {
        cardList.add(PaymentCard.fromJson(jsonDecode(temp[i])));
      }

      return cardList;
    } else {
      // Eğer "paymentCards" anahtarına sahip değerler yoksa, boş bir liste döndürülür
      return [];
    }
  }

  // Ödeme kartlarını depolamak için kullanılan fonksiyon
  saveCards(List<PaymentCard> cards) async {
    // FlutterSecureStorage nesnesi oluşturulur
    const storage = FlutterSecureStorage();

    // Ödeme kartları JSON formatına dönüştürülür
    List<String> cardsString = [];

    for (var i = 0; i < cards.length; i++) {
      cardsString.add(jsonEncode(cards[i].toJson()));
    }

    // JSON formatındaki ödeme kartları "paymentCards" anahtarına kaydedilir
    await storage.write(key: "paymentCards", value: jsonEncode(cardsString));
  }

  // Uygulama verilerini temizlemek için kullanılan fonksiyon
  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}