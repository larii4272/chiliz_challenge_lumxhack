import 'package:flutter/material.dart';
import 'package:flutter_app/shared/themes/app_colors.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class TabTittleWidget extends StatefulWidget {
  final bool? isOnPage;
  final VoidCallback onTap;
  final String title;
  const TabTittleWidget(
      {super.key, required this.title, required this.onTap, this.isOnPage});

  @override
  State<TabTittleWidget> createState() => _TabTittleWidgetState();
}

class _TabTittleWidgetState extends State<TabTittleWidget> {
  bool isHoved = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => setState(
        () {
          isHoved = value;
          print(value);
        },
      ),
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: widget.isOnPage == true ? null : widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          widget.title,
          style: GoogleFonts.inter(
            fontWeight: widget.isOnPage == true
                ? FontWeight.bold
                : (isHoved ? FontWeight.bold : FontWeight.normal),
            fontSize: 28,
            color: widget.isOnPage == true
                ? AppColors.primary
                : !isHoved
                    ? Colors.black45
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}
