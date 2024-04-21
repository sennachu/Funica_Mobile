import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VaseScreen extends StatefulWidget {
  const VaseScreen({Key? key}) : super(key: key);

  @override
  State<VaseScreen> createState() => _VaseScreenState();
}

class _VaseScreenState extends State<VaseScreen> {
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
        title: Text("vase"),
      ),
      body: Center(
        child: Text("vase"),
      ),
    );
  }
}
