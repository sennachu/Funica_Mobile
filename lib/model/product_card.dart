import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Google Fonts paketini ekledik
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product_detail.dart';
import 'package:gap/gap.dart';
import 'package:grock/grock.dart';

// Ürün kartını temsil eden sınıf
class ProductCard extends StatefulWidget {
  // Ürünü temsil eden nesne
  Product product;
  // Ürün kartına tıklandığında çalışacak işlem
  Function onTap;
  // Ürünün favorilere eklendiğinde çalışacak işlem
  Function functionOnTapFavorite;

  // Ürün kartını oluşturan constructor
  ProductCard({required this.product, required this.onTap, required this.functionOnTapFavorite});

  @override
  // Ürün kartının durumunu yöneten sınıf
  _ProductCardState createState() => _ProductCardState();
}

// Ürün kartının durumunu yöneten sınıf
class _ProductCardState extends State<ProductCard> {
  @override
  // Ürün kartının görsel kısmı
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        // Ürün kartına tıklandığında çalışacak işlem
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: widget.product, onTap: widget.onTap,),
            ),
          );
        },
        child: Container(
          // Ürün kartının görsel özellikleri
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(66, 35, 35, 35),
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            // Ürün kartının içeriğinin yerleşimi
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ürünün resmi ve favori butonu
              Stack(
                alignment: Alignment.topRight,
                children: [
                  // Ürünün resmi
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0), // Kenar yarıçapını belirleyin
                    child: Hero(
                      tag: widget.product.photo, // Ürünün resmi için benzersiz bir etiket
                      child: Image.asset(
                        widget.product.photo, // Ürünün resmi
                        height: 150, // Resim yüksekliği
                        width: 250, // Resim genişliği
                        fit: BoxFit.cover, // Resim yüzeyine sığdır
                      ),
                    ),
                  ),
                  // Ürünün favori butonu
                  InkWell(
                    onTap: () {
                      // Ürünün favorilere eklendiğinde çalışacak işlem
                      widget.functionOnTapFavorite();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      // Ürünün favori olup olmadığına göre butonun görseli değişir
                      child: widget.product.isFavorite == false
                      ?Icon(Icons.favorite_border_outlined,color: Colors.black,): Icon(Icons.favorite,color:
                      Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              // Ürünün adı
              Padding(
                padding: 7.horizontalP,
                child: Row(
                  children: [
                    Text(
                      // Ürünün adı
                      "${widget.product.name}",
                      style: GoogleFonts.poppins(
                        // Poppins yazı tipini burada kullanıyoruz
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Ürünün detayları
              Gap(2),
              Padding(
                padding: 7.horizontalP,
                child: Row(
                  children: [
                    // Ürünün ikonu
                    Icon(
                      widget.product.icon,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    // Ürünün puanı
                    Text(
                      widget.product.puan,
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    // Ürünün kalitesi
                    Text(
                      widget.product.tire,
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Ürünün satış sayısı
                    Container(
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).brightness == Brightness.dark ? Color.fromARGB(107, 117, 117, 117) : Color.fromARGB(255, 243, 243, 243),
                      ),
                      child: Center(
                        child: Text(
                          widget.product.sold,
                          style: GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Ürünün fiyatı
              SizedBox(height: 3),
              Row(
                children: [
                  Padding(
                    padding: 10.horizontalP,
                    child: Text(
                      widget.product.price,
                      style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}