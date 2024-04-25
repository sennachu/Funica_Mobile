import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/model/product_detail.dart';

import '../bloc/cart/cart_cubit.dart';
import 'product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late CartCubit cartCubit;
  late ProductsCubit productsCubit;

  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
    productsCubit = context.read<ProductsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: widget.product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(211, 255, 255, 255),
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Hero(
                    tag: widget.product.photo,
                    child: Image.asset(
                      widget.product.photo,
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (productsCubit
                            .isFavorite(products[index]["id"] as int))
                          IconButton(
                              onPressed: () {
                                productsCubit.removeFromFavorites(
                                    products[index]["id"] as int);
                              },
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        else
                          IconButton(
                              onPressed: () {
                                productsCubit.addToFavorites(products[index]);
                              },
                              icon: const Icon(Icons.favorite_border))
                      ],
                    ),
                  
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.product.name}",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        widget.product.icon,
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        widget.product.puan,
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.product.tire,
                        style: GoogleFonts.poppins(color: Colors.black87),
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
                            widget.product.sold,
                            style: GoogleFonts.poppins(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    widget.product.price,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
