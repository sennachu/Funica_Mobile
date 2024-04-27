// bloc'lar paketinin Cubit sınıfını genişleten bir sınıftır
import 'package:flutter_bloc/flutter_bloc.dart';

// Cubit durumunun parçasıdır
part 'client_state.dart';

// Uygulama ayarlarını yöneten Cubit sınıfı
class ClientCubit extends Cubit<ClientState> {
  // Cubit'in başlangıç durumunu alan constructor
  ClientCubit(super.initialState);

  // Kullanıcının dil seçimine göre dil değiştiren metod
  changeLanguage({required String language}) {
    // Yeni bir durum oluşturur
    final newState = ClientState(
      // Dil özelliğini günceller
      language: language,
      // Diğer özellikleri geçerli durumdan alır
      darkMode: state.darkMode,
    );

    // Yeni durumu emits ederek UI güncellemesini tetikler
    emit(newState);
  }

  // Kullanıcının kararlı mod seçimine göre kararlı modu değiştiren metod
  changeDarkMode({required bool darkMode}) {
    // Yeni bir durum oluşturur
    final newState = ClientState(
      // Kararlı mod özelliğini günceller
      language: state.language,
      darkMode: darkMode,
    );

    // Yeni durumu emits ederek UI güncellemesini tetikler
    emit(newState);
  }
}