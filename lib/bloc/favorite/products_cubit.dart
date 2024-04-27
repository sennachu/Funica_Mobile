// flutter_bloc paketinin Cubit sınıfını genişleten bir sınıftır
import 'package:flutter_bloc/flutter_bloc.dart';

// product_state.dart dosyasında tanımlanan state sınıfının bir parçasıdır
part 'products_state.dart';

// Ürünleri yöneten Cubit sınıfı
class ProductsCubit extends Cubit<ProductsState> {
  // Cubit'in başlangıç durumunu alan constructor
  ProductsCubit(super.initialState);

  // Sepete ürün ekleme metodu
  addToFavorites(Map<String, dynamic> product) {
    // Mevcut favorileri alır
    var currentFavorites = state.favorites;

    // Ürün favori listenizde var mı kontrol eder
    bool found = false;

    for (int i = 0; i < currentFavorites.length; i++) {
      if (currentFavorites[i]["id"] == product["id"]) {
        found = true;
        break;
      }
    }

    // Eğer favori listenizde zaten varsa, ekleme yapmaz
    if (found) {
      // urun favori listede zaten mevcut
      // eklemeye gerek yok
    } else {
      // Favorilere ürün ekleme işlemi
      currentFavorites.add(product);

      // Yeni durum oluşturur
      final updatedState = ProductsState(
        favorites: currentFavorites,
      );

      // UI güncellenmesini tetikler
      emit(updatedState);

      print("eklendi");
    }
  }

  // Sepete ürün ekleme metodu (daha kısa hali)
  addToFavorites2(Map<String, dynamic> product) {
    // Mevcut favorileri alır
    var currentFavorites = state.favorites;

    // Ürün favori listenizde var mı kontrol eder
    if (currentFavorites.any((element) => element["id"] == product["id"])) {
      // Zaten var favori de o ürün
    } else {
      // Favorilere ürün ekleme işlemi
      currentFavorites.add(product);

      // Yeni durum oluşturur
      final newState = ProductsState(favorites: currentFavorites);

      // UI güncellenmesini tetikler
      emit(newState);
    }
  }

  // Ürün favorilere eklenip eklenmediğini kontrol eder
  bool isFavorite(String productId) {
    // Favorilerden ürünü kontrol eder
    return state.favorites.any((element) => element["id"] == productId);
  }

  // Ürünü favorilerden kaldırma metodu
  removeFromFavorites(String productID) {
    // Mevcut favorileri alır
    var currentFavorites = state.favorites;

    // Ürünü favorilerden kaldırma işlemi
    currentFavorites.removeWhere((element) => element["id"] == productID);

    // Yeni durum oluşturur
    final newState = ProductsState(favorites: currentFavorites);

    // UI güncellenmesini tetikler
    emit(newState);
  }

  // Tüm favorileri temizler
  clearFavorites() {
    // Boş bir favori listesi ile yeni durum oluşturur
    final updatedState = ProductsState(favorites: const [],
    );

    // UI güncellenmesini tetikler
    emit(updatedState);
  }
}