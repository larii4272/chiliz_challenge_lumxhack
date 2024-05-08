import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.zenDots(fontSize: 38);
  static final TextStyle logo = GoogleFonts.zenDots(
    fontSize: 38,
    color: AppColors.primary,
  );
  static final TextStyle subtile = GoogleFonts.inter(fontSize: 24);
  static final TextStyle description = GoogleFonts.inter(fontSize: 24);
  static final TextStyle contador =
      GoogleFonts.zenDots(fontSize: 50, color: AppColors.primary);
}

class PageBannerTextStyles {
  static final TextStyle logoClara =
      GoogleFonts.zenDots(fontSize: 20, color: AppColors.secondary);
  static final TextStyle logoEscura =
      GoogleFonts.zenDots(fontSize: 20, color: Colors.black);
  static final TextStyle logoRoxa =
      GoogleFonts.zenDots(fontSize: 20, color: AppColors.primary);
  static final TextStyle textClaro =
      GoogleFonts.inter(fontSize: 20, color: AppColors.white);
  static final TextStyle textEscuro =
      GoogleFonts.inter(fontSize: 20, color: Colors.black);
}

class ExperienceBannerTextStyles {
  static final TextStyle atleta = GoogleFonts.zenDots(fontSize: 26);
  static final TextStyle atleta2 = GoogleFonts.zenDots(fontSize: 18);
  static final TextStyle description = GoogleFonts.inter(fontSize: 14);
  static final TextStyle title =
      GoogleFonts.zenDots(fontSize: 18, color: const Color(0xff4536A5));
  static final TextStyle title2 = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle experience = GoogleFonts.inter(fontSize: 12);
  static final TextStyle tags =
      GoogleFonts.inter(fontSize: 12, color: const Color(0xff4536A5));
}
