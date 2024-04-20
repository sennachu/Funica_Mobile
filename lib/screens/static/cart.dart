import 'package:flutter/material.dart';
import '../../widgets/bottomNavigation.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              child: Center(child: Text("cart")),
            ),
            
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              
            ),
           BottomNavigator(selectedIndex:1),
        ],
      ),
    );
  }
}