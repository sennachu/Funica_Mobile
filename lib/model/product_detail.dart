import 'package:flutter/material.dart';
import 'package:funica_mobile/model/product.dart';
import 'package:funica_mobile/screens/static/home.dart';
import 'package:grock/grock.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail({required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              image(),
              
              subDetail(),
              title(context),
              colors(),

            ],
          ),
          appbar(context)
        ],
      ),
    );
  }

  Padding title(BuildContext context) {
    return Padding(
              padding: [20,20,20,0].paddingLTRB,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product.descTitle,
                  style: _subTitle,),
                  const SizedBox(height:8),
                  Text(widget.product.descDetail,
                  style: Theme.of(context).textTheme.caption,),
                ],
              ),
            );
  }

  SafeArea appbar(BuildContext context) {
    return SafeArea(
          child: Padding(
            padding: 10.horizontalP,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                   onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.arrow_back,
                size: 30,
                color:Colors.black),
                ),
                IconButton(
                  onPressed:() {}, 
                icon: Icon(
                  Icons.bookmark_border_rounded,
                  size: 30,
                  color: Colors.black,))
              ],
            ),
          ),
        );
  }

  Padding colors() {
    return Padding(padding: [20,20,20,0].paddingLTRB,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Colors",
                style: _subTitle,),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 5,
                  children: [
                    for (int i = 0; i <  widget.product.colors.length; i++)
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.product.colors[i],
                      ),
                    ),],
                  ),
              ],
            ),
            );
  }

  Padding subDetail() {
    return Padding(
              padding: [20,20,20,0].paddingLTRB,
              child: Text(widget.product.name,
              style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
              ),
            );
  }

  SizedBox image() {
    return SizedBox(
              height: 350,
              width: double.maxFinite,
              child: Hero(tag: widget.product.photo,
               child: Image.asset(widget.product.photo,
               fit: BoxFit.cover ),
               ),
            );
  }
  TextStyle _subTitle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}







