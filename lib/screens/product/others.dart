import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OthersScreen extends StatefulWidget {
  const OthersScreen({Key? key}) : super(key: key);

  @override
  State<OthersScreen> createState() => _OthersScreenState();
}

class _OthersScreenState extends State<OthersScreen> {
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
        title: Text("others"),
      ),
      body: Center(
        child: Text("others"),
      ),
    );
  }
}
