import 'package:flutter/material.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/core/locazilations.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Favori ürünleri görüntülemek için kullanılan ekran
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  // Ekranın durumunu yöneten nesne
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

// Ekranın durumunu yöneten sınıf
class _FavoritesScreenState extends State<FavoritesScreen> {
  // Uygulama için ürünleri ve sepeti yöneten Cubit nesneleri
  late ProductsCubit productsCubit;
  late CartCubit cartCubit;

  // Ekran oluşturulurken çalışacak işlemler
  @override
  void initState() {
    super.initState();
    // Cubit nesneleri alınır
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
  }

  // Ekranın görsel kısmı
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ekranın üst kısmı
      appBar: AppBar(
        // Ekran başlığı
        title: Text("Favoriler"),
        // Ekranın sağ üst kısmında bulunacak sepet simgesi
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            // Sepete git butonu
            child: IconButton(
              // Sepete git butonuna basıldığında çalışacak işlemler
              onPressed: () => GoRouter.of(context).push("/cart"),
              // Sepete git butonuna basıldığında gösterilecek simge
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      // Ekranın iç kısmı
      body: BlocBuilder<ProductsCubit, ProductsState>(
        // Cubit nesnesinin durumuna göre ekranın iç kısmını oluştur
        builder: (context, state) {
          return SizedBox.expand(
            child: ListView.builder(
              // Ekranda görüntülenecek ürün sayısı
              itemCount: state.favorites.length,
              // Her bir ürün için çalışacak işlemler
              itemBuilder: (context, index) => Container(
                // Her bir ürünün görsel kısmı
                decoration: BoxDecoration(
                  // Çerçeve rengi
                  border: Border.all(
                    color: Colors.black,
                  ),
                  // Yuvarlak kenarlar
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // Her bir ürünün aralarındaki boşluk
                margin: const EdgeInsets.all(14.0),
                // Her bir ürünün iç kısmı
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  // Her bir ürünün iç kısmını oluşturan kısımlar
                  children: [
                    // Her bir ürünün resmi ve adı
                    Row(
                      children: [
                        // Her bir ürünün resmi
                        Image.asset(
                          // Resim yolu
                          state.favorites[index]["photo"],
                          // Resim boyutu
                          height: 90,
                        ),
                        // Her bir ürünün adı ve favori butonu
                        Column(
                          // Her bir ürünün adı ve favori butonunun yerleşimi
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Her bir ürünün adı
                            Text(state.favorites[index]["name"]),
                            // Eğer ürün favorilere eklenmişse
                            if (productsCubit.isFavorite(state.favorites[index]["id"]))
                              // Favoriden çıkarmak için buton
                              IconButton(
                                  // Butona basıldığında çalışacak işlemler
                                  onPressed: () {
                                    // Ürün favorilerden çıkarılır
                                    productsCubit.removeFromFavorites(state.favorites[index]["id"]);
                                  },
                                  // Butonun görsel kısmı
                                  icon: Row(
                                    // Butonun iç kısmı
                                    children: [
                                      // Butonun simgesi
                                      const Icon(
                                        Icons.favorite,
                                        // Butonun rengi
                                        color: Colors.red,
                                      ),
                                      // Butonun yazısı
                                      SizedBox(
                                        width: 8,
                                      ),
                                      // Butonun yazısı
                                      Text("Favoriden Kaldır"),
                                    ],
                                  ))
                            // Eğer ürün favorilere eklenmemişse
                            else
                              // Favorilere eklemek için buton
                              IconButton(
                                  // Butona basıldığında çalışacak işlemler
                                  onPressed: () {
                                    // Ürün favorilere eklenecek
                                    productsCubit.addToFavorites(state.favorites[index]);
                                  },
                                  // Butonun görsel kısmı
                                  icon: const Icon(Icons.favorite_border,)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}