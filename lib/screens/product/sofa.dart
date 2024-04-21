import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SofaScreen extends StatefulWidget {
  const SofaScreen({Key? key}) : super(key: key);

  @override
  State<SofaScreen> createState() => _SofaScreenState();
}

class _SofaScreenState extends State<SofaScreen> {
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
        title: Text("sofa"),
      ),
      body: Center(
        child: Text("sofa"),
      ),
    );
  }
}
