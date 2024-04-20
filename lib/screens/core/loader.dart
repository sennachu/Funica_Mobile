import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    storage.clearStorage();
    final firstLaunch = await storage.isFirstLaunch();

    if (firstLaunch) {
      //tanitima gönder
      //navigate to boarding screen
      GoRouter.of(context).replace("/boarding");
    } else {
      //ana ekrana git
      //navigate to home screen
      GoRouter.of(context).replace("/letin");
    }
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}