import 'package:flutter/material.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/core/locazilations.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late ProductsCubit productsCubit;
  late CartCubit cartCubit;

  @override
  void initState() {
    super.initState();
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoriler"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/cart"),
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.all(14.0),
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          state.favorites[index]["photo"],
                          height: 90,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.favorites[index]["name"]),
                            if (productsCubit.isFavorite(state.favorites[index]["id"]))
                              IconButton(
                                  onPressed: () {
                                    productsCubit.removeFromFavorites(state.favorites[index]["id"]);
                                  },
                                  icon: Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text("Favoriden Kaldir"),
                                    ],
                                  ))
                            else
                              IconButton(
                                  onPressed: () {
                                    productsCubit.addToFavorites(state.favorites[index]);
                                  },
                                  icon: const Icon(Icons.favorite_border,))
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        );
      }),
    );
  }
}
