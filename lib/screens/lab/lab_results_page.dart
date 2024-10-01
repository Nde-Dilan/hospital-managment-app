import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class LabResultPage extends StatelessWidget {
  const LabResultPage({super.key});

  static final _log = Logger('lab_results_page.dart');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();
    _log.shout("Show yourself");

    TextStyle titleStyle = TextStyle(
        fontSize: 36, fontWeight: FontWeight.w900, color: palette.trueWhite);
    TextStyle tagStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: palette.trueWhite);
    TextStyle dateStyle = TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: palette.trueWhite);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(clipBehavior: Clip.none, children: [
              PreferredSize(
                preferredSize: Size.fromHeight(size.height * .29),
                child: CustomAppBar(
                  containerHeight: size.height * .50,
                  topSpacing: 0,
                  radius: 20,
                  horizontalSpacing: 14,
                  widthFactor: .558,
                  fontSize: 20,
                  introText: "View your Lab Results,",
                  title: "Lab Results",
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  top: 114,
                  positionedWidget: SearchInput(
                    topSpacing: 90,
                    placeholder: "Search here...",
                    handleSearchAction: () {},
                  ),
                  spacing: 0,
                  bottomSpacing: 0,
                ),
              ),
              Positioned(
                top: size.height * 0.25,
                left: size.width * 0.1,
                right: size.width * 0.1,
                child: Column(
                  children: [
                    Text(
                      "Blood Test",
                      style: titleStyle,
                    ),
                    Text(
                      "30/06/2024",
                      style: dateStyle,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: size.height * 0.35,
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  child: Container(
                    height: size.height * 0.349785,
                    width: size.width * 0.888888,
                    padding: EdgeInsets.symmetric(
                        vertical: size.width * .009,
                        horizontal: size.width * .009),
                    decoration: BoxDecoration(
                      border: Border.all(color: palette.trueWhite, width: 01),
                      borderRadius: BorderRadius.all(
                          Radius.circular(size.width * .06042)),
                      color: palette.trueWhite,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Image.asset("assets/images/chart.png")),
                            SizedBox(
                              height: size.height * 0.109109349785,
                              width: size.width * 0.29109888888,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Blood Diagnostic",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: palette.textDark),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(size.width * .009),
                                    decoration: BoxDecoration(
                                        color: palette.violet,
                                        borderRadius: BorderRadius.circular(9)),
                                    child: Text(
                                      "Normal",
                                      style: tagStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Image.asset(
                                    "assets/images/blood-pressure.png")),
                            SizedBox(
                              height: size.height * 0.109109349785,
                              width: size.width * 0.29109888888,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Download Results",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: palette.textDark),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.29,
                                    height: size.width * 0.109,
                                    child: TextButton(
                                      //padding: EdgeInsets.all(size.width * .009),
                                      // decoration: BoxDecoration(

                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                palette.violet),
                                      ),
                                      onPressed: () {
                                        _log.shout("Downloading the results");
                                      },
                                      child: Text(
                                        "Download",
                                        style: tagStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.23927),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(size.width * .009),
                      decoration: BoxDecoration(
                          color: palette.violet,
                          borderRadius: BorderRadius.circular(9)),
                      child: Text(
                        "X-ray Images",
                        style: tagStyle,
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.03059,
                    ),
                    Container(
                      height: size.height * 0.1666,
                      width: size.width * 0.888888,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset("assets/images/x-ray.png"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 2,
      ),
    );
  }
}
