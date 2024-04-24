import 'package:flutter/material.dart';

class Product {
  final String id;
  final String photo;
  final String name;
  final IconData icon;
  final String price;
  final String puan;
  final String tire;
  final String sold;
  final String descTitle;
  final String descDetail;
  List<Color> colors;
  Product({
    required this.id,
    required this.icon,
    required this.photo,
    required this.name,
    required this.price,
    required this.puan,
    required this.tire,
    required this.sold,
    required this.descTitle,
    required this.descDetail,
    required this.colors,
  });
}
