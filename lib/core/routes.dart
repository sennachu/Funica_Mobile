import 'package:flutter/material.dart';
import 'package:funica_mobile/chatBot/chatBot.dart';
import 'package:funica_mobile/model/product_detail.dart';
import 'package:funica_mobile/screens/static/home_in.dart';
import 'package:funica_mobile/screens/user_login_screen/letyouin.dart';
import 'package:funica_mobile/screens/product/chair.dart';
import 'package:go_router/go_router.dart';
import '../screens/user_login_screen/login.dart';
import '../screens/user_login_screen/profile.dart';
import '../screens/user_login_screen/register.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/product/cupboard.dart';
import '../screens/product/kitchen.dart';
import '../screens/product/lamp.dart';
import '../screens/product/others.dart';
import '../screens/product/search.dart';
import '../screens/product/sofa.dart';
import '../screens/product/table.dart';
import '../screens/product/vase.dart';
import '../screens/profile_sec/adress.dart';
import '../screens/profile_sec/edit_profile.dart';
import '../screens/profile_sec/help.dart';

import '../screens/profile_sec/notification.dart';
import '../screens/static/wallet.dart';
import '../screens/profile_sec/privacy.dart';
import '../screens/profile_sec/security.dart';
import '../screens/static/boarding.dart';
import '../screens/static/cart.dart';
import '../screens/static/home.dart';
import '../screens/static/orders.dart';
import '../screens/static/wallet.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shelNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    ShellRoute(
      navigatorKey: _shelNavigatorKey,
      builder: (context, state, child) => HomeInScreen(
        
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shelNavigatorKey,
          path: '/home',
           pageBuilder: (context, state) => 
            const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shelNavigatorKey,
          path: '/cart',
           pageBuilder: (context, state) => 
            const NoTransitionPage(child: CartScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shelNavigatorKey,
          path: '/wallet',
          pageBuilder: (context, state) => 
            const NoTransitionPage(child: PaymentScreen()),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
    path: '/profile',
    builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/letin',
      builder: (context, state) => LetinScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/sofa',
      builder: (context, state) => const SofaScreen(),
    ),
    GoRoute(
      path: '/chair',
      builder: (context, state) => const ChairScreen(),
    ),
    GoRoute(
      path: '/table',
      builder: (context, state) => const TableScreen(),
    ),
    GoRoute(
      path: '/kitchen',
      builder: (context, state) => const KitchenScreen(),
    ),
    GoRoute(
      path: '/lamp',
      builder: (context, state) => const LampScreen(),
    ),
    GoRoute(
      path: '/cupboard',
      builder: (context, state) => const CupboardScreen(),
    ),
    GoRoute(
      path: '/vase',
      builder: (context, state) => const VaseScreen(),
    ),
    GoRoute(
      path: '/others',
      builder: (context, state) => const OthersScreen(),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: '/notification',
      builder: (context, state) => const NotificationScreen(),
    ),
    GoRoute(
      path: '/security',
      builder: (context, state) => const SecurityScreen(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const PrivacyScreen(),
    ),
    GoRoute(
      path: '/help',
      builder: (context, state) => const HelpScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const SoruSorScreen(),
    ),
  ],
);
