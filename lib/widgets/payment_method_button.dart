import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  final String image;
  final Color color;
  final Color highlightColor;
  final Color backColor;
  final String moneyType;
  final Function()? onTap;
  const PaymentButton(
      {super.key,
      required this.image,
      required this.moneyType,
      required this.color,
      required this.backColor,
      this.onTap,
      required this.highlightColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: highlightColor,
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.775,
        padding: const EdgeInsets.only(top: 8, right: 0, bottom: 7),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: backColor,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Row(
          children: [
            Image(image: AssetImage(image)),
            Text(
              moneyType,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
