import 'package:flutter/material.dart';
import 'package:hospital_managment_app/widgets/custom_stack.dart';

class PaymentWith extends StatelessWidget {
  final String operator;
  final String image;
  final bool isMTNFirst;

  const PaymentWith(
      {super.key,
      required this.operator,
      required this.isMTNFirst,
      required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomStack(
        topSpacing: 0,
        radius: 15,
        horizontalSpacing: 20,
        fontSize: 24,
        title: "Payment with $operator",
        mainAxisAlignment: MainAxisAlignment.center,
        positionedWidget: Image(
          image: AssetImage(image),
          height: 144,
        ),
        top: size.width * 0.19,
        left: size.width * 0.19,
        spacing: 14,
        bottomSpacing: 30,
      ),
    );
  }
}
