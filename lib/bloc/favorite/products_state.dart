// products_cubit.dart dosyasında tanımlanan state sınıfının bir parçasıdır
part of 'products_cubit.dart';

// Ürünleri tutan bir state sınıfı
class ProductsState {
  // Favori ürünleri tutan bir liste
  final List<Map<String, dynamic>> favorites;

  // State sınıfının constructor'ı
  ProductsState({this.favorites = const []});
}