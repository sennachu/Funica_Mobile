import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LampScreen extends StatefulWidget {
  const LampScreen({Key? key}) : super(key: key);

  @override
  State<LampScreen> createState() => _LampScreenState();
}

class _LampScreenState extends State<LampScreen> {
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
        title: Text("lamp"),
      ),
      body: Center(
        child: Text("lamp"),
      ),
    );
  }
}
