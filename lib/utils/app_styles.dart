import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appColor.dart';

class AppStyles {
  static final TextStyle bold16White = GoogleFonts.elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColor.white,
  );
  static final TextStyle bold24Black = GoogleFonts.elMessiri(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColor.blackColor,
  );
  static final TextStyle bold14Black = GoogleFonts.elMessiri(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColor.blackColor,
  );
}
