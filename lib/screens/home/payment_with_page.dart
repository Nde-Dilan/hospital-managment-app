import 'package:flutter/material.dart';
import 'package:hospital_managment_app/widgets/custom_stack.dart';

class PaymentWith extends StatelessWidget {
  final String operator;
  final String image;
  final bool isMTNFirst;

  const PaymentWith({super.key, required this.operator, required this.isMTNFirst, required this.image});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomStack(
        topSpacing: 14,
        radius: 14,
        horizontalSpacing: 0,
        fontSize: 14,
        title: "Payment with MTN",
        mainAxisAlignment: MainAxisAlignment.start,
        positionedWidget: Image(image: AssetImage(image)),
        spacing: 14,
      ),
    );
  }
}
