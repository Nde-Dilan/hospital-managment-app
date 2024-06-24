import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class SetAppointmentPage extends StatelessWidget {
  const SetAppointmentPage(
      {super.key,
      required this.name,
      required this.speciality,
      required this.rating});
  final String name;
  final String speciality;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    TextStyle ratingStyle = TextStyle(
        color: palette.textDark, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle specialityStle = TextStyle(
        color: palette.textFade, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle nameStyle = TextStyle(
        color: palette.textDark, fontSize: 16, fontWeight: FontWeight.w600);

    TextStyle titleStyle = TextStyle(
        fontSize: 36, fontWeight: FontWeight.w900, color: palette.textDark);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * .05893,
        centerTitle: true,
        title: Text(
          "Detail Doctor",
          style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(
                left: size.width * .02149, bottom: size.width * .010149),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Adjust color and opacity
                    blurRadius: 4.0, // Set blur radius to 4
                    offset: const Offset(0, 4),
                  ),
                ],
                color: palette.trueWhite,
                borderRadius: BorderRadius.circular(9)),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 30,
              color: palette.textDark,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .01358, vertical: size.width * .058),
              padding: EdgeInsets.symmetric(horizontal: size.width * .058),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .0058,
                        vertical: size.width * .0058),
                    width: size.width * 0.29302,
                    height: size.width * 0.2186,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(size.width * .06042)),
                      color: palette.doctorBack,
                    ),
                    child: Image.asset("assets/images/doctor-profile.png"),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: nameStyle,
                        ),
                        Text(
                          speciality,
                          style: specialityStle,
                        ),
                        Text("⭐ $rating", style: ratingStyle),
                      ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Biography",
                      style: specialityStle,
                    ),
                    Text(
                        "Dr. Jenny Wilson (Implantologist),  is a Dentist in America, she has 20 years of...  Read More",
                        style: specialityStle),
                  ]),
            ),
            Row(
              children: [
                DatePickerDialog(
                    firstDate: DateTime.now(), lastDate: DateTime(2025))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
