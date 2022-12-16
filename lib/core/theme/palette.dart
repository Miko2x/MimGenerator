
import 'dart:ui';

class Palette {

  /// Construct a color from a hex code string, of the format #RRGGBB.
  static Color hexToColor(String? code) {
    if (code == null) {
      return hexToColor('#FF6B6B');
    }
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String colorToHex(Color color) {
    var colorString = color.toString();
    var convertColorToHex = "#${colorString.substring(10, colorString.length - 1)}";
    return convertColorToHex;
  }

  static Color primary = const Color(0xFF333333);

  static Color c10 = const Color(0xFFFFD6D6);
  static Color c30 = const Color(0xFFFF8585);
  static Color c40 = const Color(0xFFFF6B6B);
  static Color b0 = const Color(0xFFEBF5FB);
  static Color b10 = const Color(0xFFD5EAF7);
  static Color b20 = const Color(0xFF9FD0EE);
  static Color b30 = const Color(0xFF53AAE0);
  static Color b40 = const Color(0xFF2D98DA);
  static Color b50 = const Color(0xFF2479AE);
  static Color d0 = const Color(0xFFE7F2F7);
  static Color d5 = const Color(0xFFc8e8ff);
  static Color d10 = const Color(0xFFB9DAE9);
  static Color d30 = const Color(0xFF2E90BE);
  static Color d40 = const Color(0xFF0F7AAE);
  static Color d50 = const Color(0xFF006391);
  static Color d60 = const Color(0xFF2db5c9);
  static Color g0 = const Color(0xFFEAF9F1);
  static Color g20 = const Color(0xFF71D6A0);
  static Color g30 = const Color(0xFF48CA85);
  static Color g40 = const Color(0xFF20BF6B);
  static Color g50 = const Color(0xFFadc021);
  static Color m40 = const Color(0xFFA27842);
  static Color n0 = const Color(0xFFFFFFFF);
  static Color n10 = const Color(0xFFF5F7F8);
  static Color n20 = const Color(0xFFEDEEF1);
  static Color n30 = const Color(0xFFC9CED7);
  static Color n40 = const Color(0xFFA5AEBD);
  static Color n50 = const Color(0xFF818DA3);
  static Color n60 = const Color(0xFF5D6D89);
  static Color n70 = const Color(0xFF394D6F);
  static Color o0 = const Color(0xFFFEF3EC);
  static Color o30 = const Color(0xFFFA9856);
  static Color o40 = const Color(0xFFFA8231);
  static Color p0 = const Color(0xFFF3ECF5);
  static Color p5 = const Color(0xFFEFEFFC);
  static Color p20 = const Color(0xFF7A78C6);
  static Color p30 = const Color(0xFF9957A7);
  static Color p40 = const Color(0xFF833294);
  static Color p60 = const Color(0xFF612d7a);
  static Color r0 = const Color(0xFFFDEDF0);
  static Color r20 = const Color(0xFFF5A5B4);
  static Color r40 = const Color(0xFFEB3B5A);
  static Color r50 = const Color(0xFFC1314A);
  static Color v30 = const Color(0xFFD7588D);
  static Color v40 = const Color(0xFFCF3474);
  static Color y0 = const Color(0xFFFEF8EC);
  static Color y20 = const Color(0xFFFBDEA1);
  static Color y40 = const Color(0xFFF7B731);
  static Color y70 = const Color(0xFFc06b21);
}