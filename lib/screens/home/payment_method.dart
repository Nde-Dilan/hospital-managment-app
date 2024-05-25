import 'package:flutter/material.dart';
import 'package:hospital_managment_app/widgets/custom_stack.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomStack(
            topSpacing: 14,
            radius: 20,
            verticalSpacing: 14,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
