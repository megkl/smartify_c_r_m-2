import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Projectcard extends StatelessWidget {
  const Projectcard({
    Key? key,
    required String this.projectText,
    required bool this.isActive,
  }) : super(key: key);
  final String projectText;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: !this.isActive
              ? Color.fromRGBO(221, 229, 249, 1)
              : Color.fromRGBO(130, 0, 255, 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          this.projectText,
          style: GoogleFonts.montserrat(
            color: !this.isActive ? Colors.grey : Colors.white,
            fontSize: 12,
          ),
        ));
  }
}