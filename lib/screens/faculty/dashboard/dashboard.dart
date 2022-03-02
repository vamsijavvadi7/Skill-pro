import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';
import 'package:http/http.dart' as http;
import 'competencies.dart';

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
          future: fetchCompetencies(http.Client(),4),
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
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       // This is for the user details
      //       // 1.Profile Picture from gamil
      //       // 2.Name of the user
      //       // 3.Email of the user
      //       GetFacultyDetails(
      //           controller:
      //               controller), //Returns details of faculty. Ex:Name,Email,Role,ProfilePicture

      //       //To create line between user details and competencies
      //       Divider(
      //         height: 20.00,
      //         thickness: 2.00,
      //         color: Colors.black,
      //       ),

      //       //Competency Details
      //       Expanded(
      //           child: ListView(
      //         padding: EdgeInsets.all(5),
      //         children: <Widget>[
      //           ClipRRect(
      //             borderRadius: BorderRadius.circular(15),
      //             child: Container(
      //               color: secondaryColor,
      //               child: ExpansionTile(
      //                 collapsedBackgroundColor: secondaryColor,
      //                 title: Text('Competency 1',
      //                     style: GoogleFonts.poppins(color: Colors.white)),
      //                 leading: CircleAvatar(
      //                     backgroundColor: Colors.white,
      //                     child: Text(
      //                       'C1',
      //                       style: GoogleFonts.baloo(),
      //                     )),
      //                 children: <Widget>[
      //                   Container(
      //                     color: Colors.white,
      //                     child: SingleChildScrollView(
      //                       scrollDirection: Axis.horizontal,
      //                       child: DataTable(
      //                         headingTextStyle: GoogleFonts.poppins(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.bold),
      //                         dataTextStyle:
      //                             GoogleFonts.poppins(color: Colors.black),
      //                         columns: <DataColumn>[
      //                           DataColumn(numeric: true, label: Text('S.No')),
      //                           DataColumn(label: Text('Reg.No')),
      //                           DataColumn(label: Text('Name')),
      //                           DataColumn(label: Text('Self%')),
      //                           DataColumn(
      //                             label: Text('Faculty%'),
      //                           ),
      //                         ],
      //                         rows: <DataRow>[
      //                           DataRow(cells: <DataCell>[
      //                             DataCell(Text('1')),
      //                             DataCell(Text('18pa1a0531')),
      //                             DataCell(Text('Cheruku Vamsi')),
      //                             DataCell(Text('82')),
      //                             DataCell(Text('76')),
      //                           ]),
      //                           DataRow(cells: <DataCell>[
      //                             DataCell(Text('2')),
      //                             DataCell(Text('18pa1a0561')),
      //                             DataCell(
      //                                 Text('Javvadi Venkata Vamsi Krishna')),
      //                             DataCell(Text('82')),
      //                             DataCell(Text('75')),
      //                           ]),
      //                           DataRow(cells: <DataCell>[
      //                             DataCell(Text('3')),
      //                             DataCell(Text('18pa1a0502')),
      //                             DataCell(Text('Adabala Jyothi')),
      //                             DataCell(Text('82')),
      //                             DataCell(TextButton(
      //                               child: Text('assess'),
      //                               onPressed: () {
      //                                 Navigator.of(context).push(
      //                                     MaterialPageRoute(
      //                                         builder: (context) =>
      //                                             EvaluationForm()));
      //                               },
      //                             )),
      //                           ]),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //                 iconColor: Colors.white,
      //                 collapsedIconColor: Colors.white,
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //         ],
      //       )),
      //     ],
      //   ),
      // ),
    );
  }
}
