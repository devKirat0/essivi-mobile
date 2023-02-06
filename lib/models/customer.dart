import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/models/order.dart';
class Customer{
  late String firstnameOfCustomer;
  late String lastnameOfCustomer;
  late String customerPhone;
  late double longitude;
  late double latitude;
  late List<Order> orders;

  Customer({required this.firstnameOfCustomer,required this.lastnameOfCustomer,required this.customerPhone,required this.longitude,required this.latitude,required this.orders});

  factory Customer.fromJson(Map<String,dynamic> json){
    return Customer(
      firstnameOfCustomer: json['firstnameOfCustomer'] as String,
      lastnameOfCustomer: json['lastnameOfCustomer'] as String,
      customerPhone: json['customerPhone'] as String,
      longitude: json['longitude'] as double,
      latitude: json['latitude'] as double,
      orders: json['user_id'] as List<Order>
    );
  }
}
