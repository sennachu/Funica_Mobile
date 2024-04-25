import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/cart/cart_cubit.dart';

import 'bloc/client/client_cubit.dart';
import 'core/routes.dart';
import 'core/themess.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClientCubit(
            ClientState(darkMode: false, language: "en"),
          )),
          BlocProvider(
          create: (context) => CartCubit(
            CartState(sepet: []),
          )),
      ],
      child: BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
          return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routes,
           themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: lightTheme,
          darkTheme: darkTheme,
         );
      }),
    );
  }
}




