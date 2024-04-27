// client_cubit.dart dosyasında tanımlanan state sınıfının bir parçasıdır
part of './client_cubit.dart';

// Uygulama ayarlarını tutan bir state sınıfı
class ClientState {
  // Dil özelliği
  final String language;

  // Kararlı mod özelliği
  final bool darkMode;

  // State sınıfının constructor'ı
  ClientState({required this.language, required this.darkMode});
}
