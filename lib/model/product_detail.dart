import 'package:flutter/material.dart';
import 'package:funica_mobile/model/product.dart';

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
      body: ListView(
        children: [
          Hero(tag: widget.product.photo,
           child: Image.asset(widget.product.photo,)
           ),
        ],
      ),
    );
  }
}







/*
AppBar(
        title: null,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back,
        size: 30,
        color:Colors.black),
        actions: [
          IconButton(onPressed:() {}, 
          icon: Icon(
            Icons.bookmark_border_rounded,
            size: 30,
            color: Colors.black,))
        ],
      ),
*/