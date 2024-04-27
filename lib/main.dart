import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:funica_mobile/bloc/cart/cart_cubit.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'bloc/client/client_cubit.dart';
import 'core/locazilations.dart';
import 'core/routes.dart';
import 'core/themess.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterSecureStorage'daki verileri temizle
  clearSecureStorageOnStart();
  runApp(MainApp());
}

void clearSecureStorageOnStart() async {
  final storage = FlutterSecureStorage();
  await storage.deleteAll();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
           BlocProvider(create: (context) => ProductsCubit(
              ProductsState(favorites: []),
           )),
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
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
           supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          locale: Locale(state.language),
         );
      }),
    );
  }
}




