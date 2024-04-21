import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:go_router/go_router.dart';

class AddressScren extends StatefulWidget {
  const AddressScren({super.key});

  @override
  State<AddressScren> createState() => _AddressScrenState();
}

class _AddressScrenState extends State<AddressScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/profile');
          },
        ),
        title: Text("Address"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(9, 137, 137, 137),
                ),
              ),
              child: Center(child: Text("Address")),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(9, 137, 137, 137),
              ),
            ),
          ),
          BottomNavigator(selectedIndex: 4),
        ],
      ),
    );
  }
}
