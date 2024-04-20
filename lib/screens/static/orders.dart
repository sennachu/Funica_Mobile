import 'package:flutter/material.dart';
import '../../widgets/bottomNavigation.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
              child: Center(child: Text("orders")),
            ),
            
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              
            ),
           BottomNavigator(selectedIndex: 2),
        ],
      ),
    );
  }
}
