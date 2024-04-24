import 'package:flutter/material.dart';
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
      child: GrockContainer(
        onTap: () {
          Grock.to(ProductDetail(product: product,));
        },
        decoration: BoxDecoration(
          color: Color.fromARGB(211, 255, 255, 255),
          borderRadius: 15.allBR,
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
            Padding(
              padding: 7.horizontalP,
              child: Row(
                children: [
                  Text(
                    "${product.name}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(width: 5),
                  Text(
                    product.tire,
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 55,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(149, 232, 232, 232),
                    ),
                    child: Center(
                      child: Text(
                        product.sold,
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
