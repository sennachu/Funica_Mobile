import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Uygulama için yerelleştirme işlemlerini yöneten sınıf
class AppLocalizations {
  // Uygulama için seçilen dil bilgilerini tutan nesne
  late Locale locale;

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın içindeki değerleri tutan nesne
  late Map<String, String> _valueText;

  // Uygulama için desteklenen dillerin listesi
  static const List<String> _supportedLanguages = [
    'en',
    'tr',
  ];

  // Uygulama için desteklenen dillerin listesi ve kısaltmalarının eşlemesi
  static const Map<String, String> _supportedLanguages2 = {
    'en': "English",
    'tr': "Türkçe",
  };

  // Uygulama için seçilen dil bilgilerini alan constructor
  AppLocalizations(this.locale);

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın örneğini alan fonksiyon
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  // Uygulama için desteklenen dillerin listesinde yer alıp almadığını kontrol eden fonksiyon
  static bool isSupported(String locale) {
    return _supportedLanguages.any((element) => locale.contains(element));
  }

  // Uygulama için desteklenen dillerin listesinde yer alan dilin kısaltmasını alan fonksiyon
  static String getSupportedLocaleCode(String locale) {
    return _supportedLanguages
        .where((element) => locale.contains(element))
        .first;
  }

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın LocalizationsDelegate'ini tanımlayan sabit
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın dil dosyasını yükleyen fonksiyon
  Future loadTranslateFile() async {
    // Uygulama için seçilen dil bilgilerine göre dil dosyasını yükler
    String langFile =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');

    // Yüklenen dil dosyasını JSON formatında işler
    Map<String, dynamic> json = jsonDecode(langFile);

    // JSON formatındaki verileri Map<String, String> formatına dönüştürür
    _valueText = json.map((key, value) => MapEntry(key, value.toString()));
  }

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın içindeki değerleri alan fonksiyon
  String getTranslate(String key) {
    // Eğer değer Map<String, String> içinde yer alıyorsa, değeri döndürür
    if (_valueText.containsKey(key)) {
      return _valueText[key]!;
    } else {
      // Eğer değer Map<String, String> içinde yer almıyorsa, giriş değeri döndürür
      return "$key";
    }
  }

  // Uygulama için desteklenen dillerin listesini alan fonksiyon
  Map<String, String> getSupportedLanguages() {
    return _supportedLanguages2;
  }
}

// Uygulama için yerelleştirme işlemlerini yöneten sınıfın LocalizationsDelegate'ini tanımlayan sınıf
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // Uygulama için desteklenen dillerin listesi
  static const List<String> _supportedLanguages = [
    'en',
    'tr',
  ];

  // AppLocalizationsDelegate sınıfının constructor'ı
  const AppLocalizationsDelegate();

  // Uygulama için desteklenen dillerin listesinde yer alıp almadığını kontrol eden fonksiyon
  @override
  bool isSupported(Locale locale) {
    return _supportedLanguages.contains(locale.languageCode);
  }

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın örneğini yükleyen fonksiyon
  @override
  Future<AppLocalizations> load(Locale locale) async {
    // Uygulama için yerelleştirme işlemlerini yöneten sınıfın örneğini oluşturur
    AppLocalizations appLocalizations = AppLocalizations(locale);

    // Uygulama için yerelleştirme işlemlerini yöneten sınıfın dil dosyasını yükler
    await appLocalizations.loadTranslateFile();

    // Uygulama için yerelleştirme işlemlerini yöneten sınıfın örneğini döndürür
    return appLocalizations;
  }

  // Uygulama için yerelleştirme işlemlerini yöneten sınıfın örneğini yeniden yüklemek için kontrol eden fonksiyon
  @override
  bool shouldReload(covariant AppLocalizationsDelegate old) => false;
}

// Uygulama için dil seçimi işlemlerini yöneten fonksiyon
Locale? localeResolutionCallback(
    Locale? deviceLocale, Iterable<Locale> supportedLocales) {
  // Eğer cihazın dil bilgisi yoksa veya desteklenen dillerden biri değilse, desteklenen dillerden ilk dil seçilir
  for (var supportedLocale in supportedLocales) {
    if (supportedLocale.languageCode == deviceLocale?.languageCode &&
        supportedLocale.countryCode == deviceLocale?.countryCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}
