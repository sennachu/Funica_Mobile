import 'product.dart';

class HomeProductsModel {
  final String? categoryTitle;
  List<Product> products;
  HomeProductsModel({
     this.categoryTitle,
    required this.products,
  });
}
