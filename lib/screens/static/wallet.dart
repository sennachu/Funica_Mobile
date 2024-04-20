import 'package:flutter/material.dart';
import '../../widgets/bottomNavigation.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
              child: Center(child: Text("wallet")),
            ),
            
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              
            ),
           BottomNavigator(selectedIndex: 3),
        ],
      ),
    );
  }
}