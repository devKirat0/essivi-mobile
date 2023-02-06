import 'package:essivi_sarl_final/models/product.dart';

class Order{
  late int ordered_quantity;
  late dynamic ordered_date;
  late int customer_id;
  late int product_id;
  late Product product;

  Order({required this.ordered_quantity,required this.ordered_date,required this.customer_id,required this.product_id,required this.product});

  factory Order.fromJson(Map<String,dynamic> json){
    return Order(
        ordered_quantity: json['ordered_quantity'] as int,
        ordered_date: json['ordered_date'] as dynamic,
        customer_id: json['customer_id'] as int,
        product_id: json['product_id'] as int,
        product: json['product'] as Product
    );
  }
}