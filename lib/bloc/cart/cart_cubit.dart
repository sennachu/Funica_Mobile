import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// CartState dosyasının bir parçası olarak tanımlanan state sınıfını dahil et
part 'cart_state.dart';

// Sepeti yöneten Cubit sınıfını tanımlar
class CartCubit extends Cubit<CartState> {
  // Cubit'ın başlangıç durumunu alan constructor
  CartCubit(super.initialState);

  // Sepete yeni bir ürün ekleyen metod
  sepeteEkle({
    // Yeni eklenicek ürünün gerekli özellikleri
    required String id,
    required String ad,
    required int sayi,
    required String fiyat,
    required String gorsel,
  }) {
    // Mevcut sepet durumunu alır
    var suankiSepet = state.sepet;

    // Yeni ürünü sepete ekler
    suankiSepet.add({
      "id": id,
      "name": ad,
      "count": sayi,
      "price": fiyat,
      "gorsel": gorsel
    });

    // Güncellenen sepete sahip yeni bir durum oluşturur
    final yeniDurum = CartState(
      sepet: suankiSepet,
    );

    // Yeni durumu emits ederek UI güncellemesini tetikler
    emit(yeniDurum);
  }

  // Sepetten belirli bir ürünü çıkaran metod
  sepettenCikart({
    // Çıkarılacak ürünün ID'si
    required String id,
  }) {
    // Mevcut sepet durumunu alır
    var suankiSepet = state.sepet;

    // Belirtilen ID'ye sahip ürünü sepetten kaldırır
    suankiSepet.removeWhere((element) => element["id"] == id);

    // Güncellenen sepete sahip yeni bir durum oluşturur
    final yeniDurum = CartState(
      sepet: suankiSepet,
    );

    // Yeni durumu emits ederek UI güncellemesini tetikler
    emit(yeniDurum);
  }

  // Sepeti tamamen boşaltan metod
  sepetiBosalt({
    // Boşaltılacak ürünün ID'si, metod genellikle tüm sepeti boşaltır
    required String id,
  }) {
    // Boş bir sepetle yeni bir durum oluşturur
    final yeniDurum = CartState(
      sepet: [],
    );

    // Yeni durumu emits ederek UI güncellemesini tetikler
    emit(yeniDurum);
  }
}
