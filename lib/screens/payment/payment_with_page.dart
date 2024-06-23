import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:hospital_managment_app/widgets/custom_stack.dart';
import 'package:hospital_managment_app/widgets/custom_text_form_field.dart';
import 'package:hospital_managment_app/widgets/payment_method_button.dart';
import 'package:provider/provider.dart';

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
    final palette = context.watch<Palette>();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStack(
              topSpacing: 0,
              radius: 15,
              horizontalSpacing: size.width * 0.09,
              fontSize: 24,
              title: "Payment with $operator",
              mainAxisAlignment: MainAxisAlignment.center,
              positionedWidget: Image(
                image: AssetImage(image),
                height: 144,
                width: size.width * 0.66,
              ),
              top: size.width * 0.19,
              left: size.width * 0.19,
              spacing: 14,
              bottomSpacing: 30,
            ),
            SizedBox(
              height: size.width * 0.052,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment method",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: palette.textDark,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: PaymentButton(
                    heightBtn: 50,
                    highlightColor: palette.trueWhite,
                    onTap: () {
                      GoRouter.of(context).go(
                          "/home/payment/${!isMTNFirst ? 'orange' : 'mtn'}");
                    },
                    image: isMTNFirst
                        ? 'assets/images/mtn-mobile-money.png'
                        : 'assets/images/orange-money.png',
                    moneyType: "Mobile Money",
                    color: !isMTNFirst ? palette.textDark : palette.trueWhite,
                    backColor: isMTNFirst ? palette.mtn : palette.orange,
                    width: 50,
                    height: 50,
                    fontSize: 14,
                  ),
                ),
                Expanded(
                  child: PaymentButton(
                    heightBtn: 50,
                    highlightColor: palette.trueWhite,
                    onTap: () {
                      GoRouter.of(context)
                          .go("/home/payment/${isMTNFirst ? 'orange' : 'mtn'}");
                    },
                    image: isMTNFirst
                        ? 'assets/images/orange-money.png'
                        : 'assets/images/mtn-mobile-money.png',
                    moneyType: "Mobile Money",
                    color: isMTNFirst ? palette.textDark : palette.trueWhite,
                    backColor: isMTNFirst ? palette.orange : palette.mtn,
                    width: 50,
                    height: 50,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.width * .042,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(color: palette.textDark, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: size.width * .0092,
                    ),
                    CustomTextFormField(
                      icon: null,
                      obscureText: false,
                      errorMessage: 'Please check your number again',
                      hintText: '237 694 52 59 31',
                    ),
                    SizedBox(
                      height: size.width * .0092,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Amount in XAF",
                        style: TextStyle(color: palette.textDark, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.4),
                      child: CustomTextFormField(
                        icon: null,
                        obscureText: false,
                        errorMessage: 'Please enter a valid amount',
                        hintText: '70,000 XAF',
                      ),
                    ),
                    SizedBox(
                      height: size.width * .0092,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(color: palette.textDark, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: size.width * .0092,
                    ),
                    CustomTextFormField(
                      icon: null,
                      obscureText: false,
                      errorMessage: 'Please your name again',
                      hintText: 'John Doe',
                    ),
                    SizedBox(
                      height: size.width * 0.20,
                    ),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onTap: () {
                                GoRouter.of(context)
                                    .go("/home/payment/congrats");
                              },
                              text: "Pay Now", radius: 28,
                              // width: 300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
