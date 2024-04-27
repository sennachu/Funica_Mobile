import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/cart/cart_cubit.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/core/locazilations.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/screens/static/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grock/grock.dart';

// Ürünün ayrıntılarını görüntüleyen ekranı temsil eden sınıf
class ProductDetail extends StatefulWidget {
  // Ürünün bilgilerini içeren nesne
  Product product;
  // Ürünün detay sayfasına tıklandığında çalışacak işlem
  Function onTap;

  // Ürünün detay sayfasını oluşturan constructor
  ProductDetail({required this.product, required this.onTap});

  @override
  // Ürünün detay sayfasının durumunu yöneten sınıf
  _ProductDetailState createState() => _ProductDetailState();
}

// Ürünün detay sayfasının durumunu yöneten sınıf
class _ProductDetailState extends State<ProductDetail> {
  // Sepet ve ürünleri yöneten Cubit nesneleri
  late CartCubit cartCubit;
  late ProductsCubit productsCubit;

  // Ürünün detay sayfasının işlemleri
  @override
  void initState() {
    super.initState();
    // Sepet ve ürünleri yöneten Cubit nesneleri alınır
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
  }

  // Ürünün detay sayfasının görsel kısmı
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      // Ürünün durumuna göre detay sayfasını oluştur
      builder: (context, state2) {
        return BlocBuilder<CartCubit, CartState>(
          // Sepetin durumuna göre detay sayfasını oluştur
          builder: (context, state) {
            return Scaffold(
              // Ürünün detay sayfasının içeriği
              body: Stack(
                children: [
                  // Ürünün resmi ve ayrıntıları
                  ListView(
                    children: [
                      image(),
                      subDetail(),
                      title(context),
                      colors(),
                      Padding(
                        padding: [20, 20, 20, 0].paddingLTRB,
                        child: ElevatedButton(
                          // Sepete ekle butonu
                          onPressed: () {
                            // Ürünün detay sayfasına tıklandığında çalışacak işlem
                            widget.onTap();
                          },
                          style: ElevatedButton.styleFrom(
                            // Butonun arkaplan rengi
                            backgroundColor: Colors.black,
                          ),
                          child: Text("Add To Cart"),
                        ),
                      ),
                    ],
                  ),
                  // Ürünün detay sayfasının üst kısmı
                  appbar(context)
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Ürünün adı ve ayrıntıları
  Padding title(BuildContext context) {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Column(
        // Ürünün adı ve ayrıntıların yerleşimi
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ürünün adı
          Text(
            widget.product.descTitle,
            style: _subTitle,
),
          // Ürünün ayrıntıları
          const SizedBox(height: 8),
          Text(
            widget.product.descDetail,
            style: TextStyle(
              // Ayrıntıların yazı tipi
              fontFamily: GoogleFonts.poppins().fontFamily,
              // Ayrıntıların yazı boyutu
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
              // Ayrıntıların yazı kalınlığı
              fontWeight: Theme.of(context).textTheme.bodySmall?.fontWeight,
            ),
          ),
        ],
      ),
    );
  }

  // Ürünün detay sayfasının üst kısmı
  SafeArea appbar(BuildContext context) {
    return SafeArea(
      // Ürünün detay sayfasının üst kısmının içeriği
      child: Padding(
        padding: 10.horizontalP,
        child: Row(
          // Ürünün detay sayfasının üst kısmının yerleşimi
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ürünün detay sayfasına tıklandığında çalışacak işlem
            IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              // Ürünün detay sayfasına tıklandığında çalışacak işlem
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.black),
            ),
            // Ürünün detay sayfasına tıklandığında çalışacak işlem
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.bookmark_border_rounded,
                  size: 30,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }

  // Ürünün renkleri
  Padding colors() {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Column(
        // Ürünün renklerinin yerleşimi
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ürünün renklerinin başlığı
          Text(
            AppLocalizations.of(context).getTranslate("Renkler"),
            style: _subTitle,
          ),
          // Ürünün renkleri
          const SizedBox(height: 8),
          // Ürünün renkleri
          Wrap(
            // Ürünün renklerinin yerleşimi
            spacing: 5,
            children: [
              // Ürünün her bir rengi
              for (int i = 0; i < widget.product.colors.length; i++)
                Container(
                  // Ürünün her bir rengi
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    // Ürünün her bir rengi
                    shape: BoxShape.circle,
                    // Ürünün her bir rengi
                    color: widget.product.colors[i],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // Ürünün detay sayfasının alt kısmı
  Padding subDetail() {
    return Padding(
      padding: [20, 20, 20, 0].paddingLTRB,
      child: Text(widget.product.name,
// Ürünün adının yazı tipi
          style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              // Ürünün adının yazı boyutu
              fontSize: 22,
              // Ürünün adının yazı kalınlığı
              fontWeight: FontWeight.bold)),
    );
  }

  // Ürünün resmi
  SizedBox image() {
    return SizedBox(
      // Ürünün resminin boyutu
      height: 350,
      // Ürünün resminin genişliği
      width: double.maxFinite,
      // Ürünün resmi
      child: Hero(
        // Ürünün resminin benzersiz etiketi
        tag: widget.product.photo,
        // Ürünün resmi
        child: Image.asset(widget.product.photo, fit: BoxFit.cover),
      ),
    );
  }

  // Ürünün adının yazı tipi
  TextStyle _subTitle = TextStyle(
    // Ürünün adının yazı tipi
    fontFamily: GoogleFonts.poppins().fontFamily,
    // Ürünün adının yazı boyutu
    fontSize: 16,
    // Ürünün adının yazı kalınlığı
    fontWeight: FontWeight.bold,
  );
}