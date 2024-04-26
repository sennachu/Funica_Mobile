import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(super.initialState);

  sepeteEkle({ required String id,required String ad, required int sayi, required String fiyat, required String gorsel}) {
    var suankiSepet = state.sepet;

    suankiSepet.add({
      "id": id,
      "name": ad,
      "count": sayi,
      "price": fiyat,
      "gorsel": gorsel
    });

    final yeniDurum = CartState(
      sepet: suankiSepet
      );
    emit(yeniDurum);
  }

 sepettenCikart({required String id}) {
    var suankiSepet = state.sepet;

    suankiSepet.removeWhere((element) => element["id"] == id);

    final yeniDurum = CartState(
      sepet: suankiSepet,
    );
    emit(yeniDurum);
  }


  sepetiBosalt(
      {required String id}) {
    final yeniDurum = CartState(
      sepet: [],
    );
    emit(yeniDurum);
  }
}
