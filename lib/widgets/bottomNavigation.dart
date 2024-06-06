import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/storage.dart';

class BottomNavigator extends StatelessWidget {
  
  final int selectedIndex;

  const BottomNavigator({
    Key? key,
    required this.selectedIndex,
     
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => context.go("/home"),
            icon: const Icon(Icons.home_outlined),
          ),
          IconButton(
            onPressed: () => context.go("/cart"),
            icon: const Icon(Icons.local_mall_outlined),
          ),
          IconButton(
            onPressed: () => context.go("/orders"),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () => context.go("/wallet"),
            icon: const Icon(Icons.account_balance_wallet_outlined),
          ),
          IconButton(
            onPressed: () => context.go("/profile"),
            icon: const Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(13.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               for (var i = 0; i < 5; i++)
//                 AltMenuItem(
//                   icon: Icon(
//                     _getIconData(i),
//                     size: 20,
//                     color: _getIconColor(i, selectedIndex),
//                   ),
//                   onTap: () {
//                     final routeName = _getRouteName(i);
//                     GoRouter.of(context).go(routeName);
//                   },
//                   isActive: i == selectedIndex,
//                   label: _getLabelText(i),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   IconData _getIconData(int index) {
//     switch (index) {
//       case 0:
//         return Icons.home_outlined;
//       case 1:
//         return Icons.local_mall_outlined;
//       case 2:
//         return Icons.shopping_cart_outlined;
//       case 3:
//         return Icons.account_balance_wallet_outlined;
//       case 4:
//         return Icons.person_2_outlined;
//       default:
//         return Icons.home;
//     }
//   }

//   Color _getIconColor(int index, int selectedIndex) {
//     return index == selectedIndex
//         ? Colors.black
//         : Color.fromARGB(95, 138, 138, 138);
//   }

//   String _getLabelText(int index) {
//     switch (index) {
//       case 0:
//         return "Home";
//       case 1:
//         return "Cart";
//       case 2:
//         return "Orders";
//       case 3:
//         return "Wallet";
//       case 4:
//         return "Profile";
//       default:
//         return "";
//     }
//   }

//   String _getRouteName(int index) {
//     switch (index) {
//       case 0:
//         return "/home";
//       case 1:
//         return "/cart";
//       case 2:
//         return "/orders";
//       case 3:
//         return "/wallet";
//       case 4:
//         return "/profile";
//       default:
//         return "/home";
//     }
//   }
// }

// class AltMenuItem extends StatelessWidget {
//   final Function()? onTap;
//   final Icon icon;
//   final bool isActive;
//   final String label;

//   const AltMenuItem({
//     Key? key,
//     required this.icon,
//     required this.onTap,
//     this.isActive = false,
//     required this.label,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon.icon,
//               size: icon.size,
//               color: isActive ? Colors.black : icon.color,
//             ),
//             Text(
//               label,
//               style: GoogleFonts.poppins(
//                 fontSize: 10,
//                 color:
//                     isActive ? Colors.black : Color.fromARGB(95, 138, 138, 138),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
