import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CupboardScreen extends StatefulWidget {
  const CupboardScreen({Key? key}) : super(key: key);

  @override
  State<CupboardScreen> createState() => _CupboardScreenState();
}

class _CupboardScreenState extends State<CupboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
        ),
        title: Text("cupboard"),
      ),
      body: Center(
        child: Text("cupboad"),
      ),
    );
  }
}
