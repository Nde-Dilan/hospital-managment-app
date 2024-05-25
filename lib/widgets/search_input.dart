import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  static final _log = Logger('search_input.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    const double padding = 8;
    const double borderRadius = 28;
    _log.info("Here the search go");

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 17, left: 17, right: 2),
          width: 300,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: palette.backgroundMain.withOpacity(.4),
                blurRadius: 54,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset("assets/icons/Search.svg"),
                ),
                filled: true,
                fillColor: palette.trueWhite,
                contentPadding: const EdgeInsets.all(padding),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    borderSide: BorderSide.none)),
          ),
        ),
        Container(
            width: 50,
            // height: 50,
            margin: const EdgeInsets.only(
              right: 4,
            ),
            child:
                const Image(image: AssetImage('assets/icons/preferences.png'))),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}
