import 'package:flutter/material.dart';

class PaymentButton extends StatelessWidget {
  /// Image you want for the button
  final String image;

  /// Width of the [image]
  final double? width;
  /// Height of the [image]
  final double? height;
  final double? heightBtn;

  final double? fontSize;

  /// Text color of [moneyType]
  final Color color;

  /// Put it to the value of your screen's background
  final Color highlightColor;

  /// Color of the button
  final Color backColor;

  /// Put the operator here
  final String moneyType;
  final Function()? onTap;
  const PaymentButton(
      {super.key,
      required this.image,
      required this.moneyType,
      required this.color,
      required this.backColor,
      this.onTap,
      required this.highlightColor, this.width, this.height, this.fontSize, this.heightBtn});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: highlightColor,
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.775,
        height: heightBtn,
        padding: const EdgeInsets.only(top: 8, right: 0, bottom: 7),
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: backColor,
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              width: width,
              height: height,
            ),
            Text(
              moneyType,
              style: TextStyle(
                fontSize: fontSize,
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
