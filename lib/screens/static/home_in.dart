import 'package:flutter/material.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';

class HomeInScreen extends StatefulWidget {
  final Widget child;
  const HomeInScreen({super.key, required this.child});

  @override
  State<HomeInScreen> createState() => _HomeInScreenState();
}

class _HomeInScreenState extends State<HomeInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      widget.child),
      bottomNavigationBar: const BottomNavigator(selectedIndex: 0),
    );
  }
}
