import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class LabTest extends StatelessWidget {
  const LabTest(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.result});
  final String image;
  final String title;
  final String description;
  final Widget result;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final Size size = MediaQuery.of(context).size;

    TextStyle headerStyle =
        TextStyle(color: palette.textDark, fontWeight: FontWeight.bold);

    return Container(
        width: size.width * .98,
        height: size.height * .335,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .01, vertical: size.width * .021),
        margin: EdgeInsets.only(
          left: size.width * .01,
          right: size.width * .01,
          top: size.width * .021,
          bottom: size.width * .0492,
        ),
        decoration: BoxDecoration(
            color: palette.backFade,
            border: Border.all(color: palette.trueWhite, width: 0),
            borderRadius:
                BorderRadius.all(Radius.circular(size.width * .06042))),
        child: Column(children: [
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    image,
                    // width: 144,
                  ),
                  Text("Result", style: headerStyle),
                ],
              ),
              SizedBox(
                width: size.width * .0082,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: headerStyle,
                  ),
                  SizedBox(
                    width: size.width * .5672, // Adjust width as needed
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Description \n", // Style the first word here
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                description.substring(12), // Get remaining text
                            style: TextStyle(color: palette.textFade),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                  width: size.width * .8,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0, top: size.width * .014),
                    child: result,
                  ))
            ],
          ),
        ]));
  }
}
