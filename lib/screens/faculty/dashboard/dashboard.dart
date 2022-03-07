import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';
import 'package:http/http.dart' as http;
import 'competencies.dart';
import 'competencydata.dart';
class FacultyDashBoard extends StatefulWidget {
  const FacultyDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<FacultyDashBoard> createState() => _FacultyDashBoardState();
}

class _FacultyDashBoardState extends State<FacultyDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "SKILLPRO",
          style: GoogleFonts.baloo(
            letterSpacing: 5,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: FutureBuilder<List<Competencies>>(
          future: fetchCompetencies(http.Client(),0,""),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else if (snapshot.hasData) {
              return CompetenciesList();
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: Colors.white,
                ),
              );
            }
          },
        ),
      ),
     );
  }
}
