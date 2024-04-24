import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../static/home.dart';

class CupboardScreen extends StatefulWidget {
  const CupboardScreen({Key? key}) : super(key: key);

  @override
  State<CupboardScreen> createState() => _CupboardScreenState();
}

class _CupboardScreenState extends State<CupboardScreen> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cupboard",style: TextStyle(fontWeight: FontWeight.bold),),
            Icon(Icons.search)
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //        Row(
      //            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             homeProductsDetails(photo: "assets/images/chair2.png",name: "Padded Chair",icon: Icon(Icons.star_half),puan: "4.5", tire: "|", sold: "8.456 sold",price: "\$120",),
      //             homeProductsDetails(photo: "assets/images/cup1.png",name: "Small Bookcase",icon: Icon(Icons.star_half),puan: "4.7", tire: "|", sold: "6.238 sold",price: "\$145",),
      //           ],
      //         ),
      //         Gap(15),
      //          Row(
      //            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             homeProductsDetails(photo: "assets/images/lamp1.png",name: "Glass Lamp",icon: Icon(Icons.star_half),puan: "4.3", tire: "|", sold: "5.156 sold",price: "\$40",),
      //             homeProductsDetails(photo: "assets/images/kitchen1.png",name: "Glass Packge",icon: Icon(Icons.star_half),puan: "4.9", tire: "|", sold: "4.968 sold",price: "\$55",),
      //           ],
      //         ),
      //          Row(
      //          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           homeProductsDetails(photo: "assets/images/chair2.png",name: "Padded Chair",icon: Icon(Icons.star_half),puan: "4.5", tire: "|", sold: "8.456 sold",price: "\$120",),
      //           homeProductsDetails(photo: "assets/images/cup1.png",name: "Small Bookcase",icon: Icon(Icons.star_half),puan: "4.7", tire: "|", sold: "6.238 sold",price: "\$145",),
      //         ],
      //       ),
      //       Gap(15),
      //        Row(
      //          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           homeProductsDetails(photo: "assets/images/lamp1.png",name: "Glass Lamp",icon: Icon(Icons.star_half),puan: "4.3", tire: "|", sold: "5.156 sold",price: "\$40",),
      //           homeProductsDetails(photo: "assets/images/kitchen1.png",name: "Glass Packge",icon: Icon(Icons.star_half),puan: "4.9", tire: "|", sold: "4.968 sold",price: "\$55",),
      //         ],
      //       ),
      //   ],),
      // )
            
            
    );
  }
}
