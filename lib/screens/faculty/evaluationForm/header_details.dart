import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Details extends StatelessWidget {
  const Details({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Competency: Competency Name',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date: 25/Dec/2021', style: GoogleFonts.poppins()),
            Text('Patient OP: 1234', style: GoogleFonts.poppins()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time: 9:00AM', style: GoogleFonts.poppins()),
            Text('For: Javvadi Vamsi', style: GoogleFonts.poppins()),
          ],
        ),
      ],
    );
  }
}
