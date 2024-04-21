import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChairScreen extends StatefulWidget {
  const ChairScreen({Key? key}) : super(key: key);

  @override
  State<ChairScreen> createState() => _ChairScreenState();
}

class _ChairScreenState extends State<ChairScreen> {
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
        title: Text("chair"),
      ),
      body: Center(
        child: Text("chair"),
      ),
    );
  }
}
