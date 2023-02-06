import 'package:essivi_sarl_final/models/category.dart';

class Product{
  late int id;
  late String labelOfProduct;
  late double unitPrice;
  late int productQuantity;
  late Category category;

  Product({required this.id,required this.labelOfProduct,required this.unitPrice,required this.productQuantity,required this.category});

  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'] as int,
      labelOfProduct: json['labelOfProduct'] as String,
      unitPrice: json['unitPrice'] as double,
      productQuantity: json['productQuantity'] as int,
      category: json['category'] as Category
    );
  }
}