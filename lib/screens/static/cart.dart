import 'package:flutter/material.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        leading: InkWell(
            onTap: () {
              GoRouter.of(context).go("/home");
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Text("Cart Screen"),
       
      ),
      body: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
        return SizedBox.expand(
          child: state.sepet.length == 0
              ? Center(child: Text("Sepet Boş"))
              : ListView.builder(
                  itemCount: state.sepet.length,
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
                                state.sepet[index]["gorsel"].toString(),
                                height: 90,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(state.sepet[index]["name"].toString()),
                                      SizedBox(width: 12.0),
                                      Text(state.sepet[index]["count"].toString() + " x", style: Theme.of(context).textTheme.titleLarge),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cartCubit.sepettenCikart(id: state.sepet[index]["id"]);
                                      },
                                      icon: Row(
                                        children: [
                                          Text("Sepetten Kaldir"),
                                        ],
                                      ))
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
