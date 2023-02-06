import 'package:essivi_sarl_final/controllers/product_controller.dart';
import 'package:essivi_sarl_final/models/customer.dart';
import 'package:essivi_sarl_final/statics/widget.dart';
import 'package:flutter/material.dart';
import '../statics/static_attributs.dart';

class CustomerCommands extends StatefulWidget{
  Customer? customer;

  CustomerCommands({super.key, required this.customer});
  @override
  State<StatefulWidget> createState() => _CustomerCommandsState(customer: customer);
}
class _CustomerCommandsState extends State<CustomerCommands>{
  Customer? customer;
  _CustomerCommandsState({required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          Statics.textEnterprise,
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5,right: 5,top:10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle,size: 35,color: Colors.blueAccent,),
                const SizedBox(width: 10,),
                Text(
                  "${customer!.lastnameOfCustomer} ${customer!.firstnameOfCustomer}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ],
            ),
            Row(
              children: const[
                SizedBox(width: 5,),
                Text(
                  "Ses commandes :",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: customer!.orders.length,
                itemBuilder: (context,index){
                  return MyWidget().anOrder(context,customer!.orders.elementAt(index));
                },
              ),
            )
          ],
        ),
      )
    );
  }

}