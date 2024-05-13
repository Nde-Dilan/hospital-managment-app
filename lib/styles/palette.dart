import 'package:flutter/material.dart';

/// A palette of colors to be used in the app.
///
/// Colors taken from this fun palette:
/// https://lospec.com/palette-list/crayola84
///
/// Colors here are implemented as getters so that hot reloading works.
/// In practice, we could just as easily implement the colors
/// as `static const`. But this way the palette is more malleable:
/// we could allow players to customize colors, for example,
/// or even get the colors from the network.
class Palette {
  Color get violet => const Color(0xff7B61FF);
  Color get darkViolet => const Color(0xFF4531AC);
  Color get category => const Color(0xFFCFC8FF);
  Color get backgroundMain => const Color(0xffF8FAFF);
  Color get textDark => const Color(0xff000000);
  Color get congrasColor => const Color(0xff0B72AC);
  Color get trueWhite => const Color(0xffffffff);
}
