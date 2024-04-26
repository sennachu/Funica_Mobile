import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/model/home_products_model.dart';
import 'package:funica_mobile/model/product_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/cart/cart_cubit.dart';
import '../../model/product_card.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late CartCubit cartCubit;
  late ProductsCubit productsCubit;
  @override
  void initState() {
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Access the chair data
    Widget homeProductCategories(HomeProductsModel model) {
      return GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        children: List.generate(
          model.products.length,
          (index) {
            return BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state2) {
                return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
                  return ProductCard(
                    functionOnTapFavorite: () {
                      Map<String, dynamic> productMap = {
                        "id": model.products[index].id,
                        "name": model.products[index].name,
                        "photo": model.products[index].photo,
                        "icon": model.products[index].icon,
                        "price": model.products[index].price,
                        "puan": model.products[index].puan,
                        "tire": model.products[index].tire,
                        "sold": model.products[index].sold,
                        "descTitle": model.products[index].descTitle,
                        "descDetail": model.products[index].descDetail,
                        "colors": model.products[index].colors,
                        "isFavorite": model.products[index].isFavorite,
                      };
                      if (model.products[index].isFavorite == false) {
                        model.products[index].isFavorite = true;
                        productsCubit.addToFavorites(productMap);
                      } else if (model.products[index].isFavorite == true) {
                        model.products[index].isFavorite = false;
                        productsCubit.removeFromFavorites(model.products[index].id);
                      }

                      setState(() {});
                    },
                    product: model.products[index],
                    onTap: () {
                      cartCubit.sepeteEkle(id: model.products[index].id, ad: model.products[index].name, sayi: 1, fiyat: model.products[index].price, gorsel: model.products[index].photo);
                    },
                  );
                });
              },
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
          "Table Products",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        child: homeProductCategories(table),
      ),
    );
  }
}
