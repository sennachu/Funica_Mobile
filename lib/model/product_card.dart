import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Google Fonts paketini ekledik
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product_detail.dart';
import 'package:gap/gap.dart';
import 'package:grock/grock.dart';

class ProductCard extends StatelessWidget {
  Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product: product),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(66, 35, 35, 35),
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Kenar yarıçapını belirleyin
                child: Hero(
                  tag: product.photo,
                  child: Image.asset(
                    product.photo,
                    height: 150,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

//BURASI HATA VERIYO PRODUCT_PROVİDER DA TANIMLADIGIMIZ ÜRÜNLERİ BURADA ÇEKEMEDİK HOCA LİSTEYİ BU SAYFA İÇİNDE TANIMLAMIŞ 
//AMA BİZDE AYRI SAYFADA VE LİSTEMİZ KATEGORILER HALİNDE AYRILMIŞ BU KONU HAKKINDA ÇÖZÜM İSTİYORUM 
//AYNI ÜRÜN ÇAĞIRMA MANTIĞI İLE SEPETE EKLE VE FAVORİ EKLE YAPILACAK SADECE
//SEPETE EKLE KISMI PRODUCTS_DETAİL SAYFASI İÇERİSİNDE

              // if (productsCubit
              //               .isFavorite(products[index]["id"] as int))
              //             IconButton(
              //                 onPressed: () {
              //                   productsCubit.removeFromFavorites(
              //                       products[index]["id"] as int);
              //                 },
              //                 icon: const Icon(
              //                   Icons.favorite,
              //                   color: Colors.red,
              //                 ))
              //           else
              //             IconButton(
              //                 onPressed: () {
              //                   productsCubit.addToFavorites(products[index]);
              //                 },
              //                 icon: const Icon(Icons.favorite_border)
              // )
                       ],
                    ),
                    
        ),
        ),
              Padding(
                padding: 7.horizontalP,
                child: Row(
                  children: [
                    Text(
                      "${product.name}",
                      style: GoogleFonts.poppins(
                        // Poppins yazı tipini burada kullanıyoruz
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(2),
              Padding(
                padding: 7.horizontalP,
                child: Row(
                  children: [
                    Icon(
                      product.icon,
                      size: 20,
                    ),
                    SizedBox(width: 6),
                    Text(
                      product.puan,
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      product.tire,
                      style: GoogleFonts.poppins(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color.fromARGB(107, 117, 117, 117)
                            : Color.fromARGB(255, 243, 243, 243),
                      ),
                      child: Center(
                        child: Text(
                          product.sold,
                          style: GoogleFonts.poppins(
                              fontSize: 8, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Padding(
                    padding: 10.horizontalP,
                    child: Text(
                      product.price,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold),
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
