// cart_state.dart dosyasında tanımlanan state sınıfının bir parçasıdır
part of 'cart_cubit.dart';

// Sepet durumunu tutan bir sınıf
class CartState {
  // Sepet, ürünlerin listesini tutar
  final List<dynamic> sepet;

  // Sepet durumunun başlangıç durumu
  CartState({required this.sepet});
}

