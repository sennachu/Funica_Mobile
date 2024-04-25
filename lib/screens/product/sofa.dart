import 'package:flutter/material.dart';
import 'package:funica_mobile/model/home_products_model.dart';
import 'package:funica_mobile/model/product_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/product_card.dart';

class SofaScreen extends StatelessWidget {
  const SofaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the chair data
    Widget homeProductCategories(HomeProductsModel model) {
      return Column(
        children: List.generate(
          (model.products.length / 2).ceil(),
          (index) {
            int startIndex = index * 2;
            int endIndex = startIndex + 2;
            if (endIndex > model.products.length) {
              endIndex = model.products.length;
            }
            return Row(
              children: List.generate(
                endIndex - startIndex,
                (i) {
                  return Expanded(
                    child: SizedBox(
                      height: 250,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductCard(
                          product: model.products[startIndex + i],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
        ),
        title: Text(
          "Sofa Products",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        child: homeProductCategories(sofa),
      ),
    );
  }
}
