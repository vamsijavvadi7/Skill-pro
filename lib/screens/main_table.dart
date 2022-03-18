import 'dart:convert';

import 'package:firstskillpro/styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'faculty/dashboard/CompetencyTable_model.dart';


class CompetencyTable extends StatelessWidget {
  // This widget is the root of your application.
  const CompetencyTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Add Rows',
      home: CompetencyDetailsTable(),
    );
  }
}

class CompetencyDetailsTable extends StatefulWidget {

  @override
  _MainTableState createState() => _MainTableState();
}

Future<CompetencyTableDetails?> sendData(String opnum) async{
  var response = await http.post(Uri.parse("https://api421.herokuapp.com/competencyevaluations/competencyid/4/studentid/18pa1a05b7"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: {"opnum":opnum,"mail":"jyothiadabala321@gmail.com"});
  var data = response.body;
  print("Plss");
  print(data);

  if(response.statusCode == 201){
    String responseString = response.body;
    CompetencyTableDetailsFromJson(responseString);
  }else return null;
}

class _MainTableState extends State<CompetencyDetailsTable> {

  late CompetencyTableDetails? _competencyTableDetails;
  final OpController = TextEditingController();
  DateTime dateToday =new DateTime.now();

  List<DataRow> _rowList = [];

  void _addRow() {
    // Built in Flutter Method.
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below.
      _rowList.add(DataRow(cells: <DataCell>[
        DataCell(Text(OpController.text)),
        DataCell(Text(DateFormat('EEE d MMM').format(dateToday))),
        DataCell(Text(DateFormat.Hms().format(dateToday))),
        DataCell(Text('2')),
        DataCell(Text('2')),
        DataCell(
          // IconButton(
          Icon(Icons.delete),
          // onPressed: _rowList.remove(cnt),
          // )
        ),
      ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Competency Details"),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),hintText: "Enter Opnum"),
                    controller : OpController,
                  ),
                ElevatedButton(onPressed: () async{
                  String opnum = OpController.text;
                  CompetencyTableDetails? data = await sendData(opnum);
                  setState(() {
                    _competencyTableDetails = data;
                  });

                },child: Text("Add"))
                ]),
          ),
          ),
        );
  }
}





        // body: Column(
        //     children: <Widget>[
        //       Expanded(
        //         child: SingleChildScrollView(
        //           padding: EdgeInsets.fromLTRB(0.0, 10, 0.0, 60.0),
        //           scrollDirection: Axis.horizontal,
        //           child: SingleChildScrollView(
        //             scrollDirection: Axis.vertical,
        //             child: DataTable(
        //                 headingRowColor: MaterialStateProperty.all(Colors.indigoAccent),
        //                 columns: [
        //                   DataColumn(label: Text('PatientOp',style: GoogleFonts.poppins(color: Colors.white))),
        //                   DataColumn(label: Text('Date',style: GoogleFonts.poppins(color: Colors.white))),
        //                   DataColumn(label: Text('Time',style: GoogleFonts.poppins(color: Colors.white))),
        //                   DataColumn(label: Text('Self    ->',style: GoogleFonts.poppins(color: Colors.white))),
        //                   DataColumn(label: Text('Faculty',style: GoogleFonts.poppins(color: Colors.white))),
        //                   DataColumn(label: Text('Delete',style: GoogleFonts.poppins(color: Colors.white))),
        //                 ], rows: _rowList),
        //           ),
        //         ),
        //       ),
        //       Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             Expanded(
        //               child: TextFormField(
        //                 controller: OpController,
        //                 decoration: InputDecoration(
        //                   border: OutlineInputBorder(),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(width: 20,),
        //             FloatingActionButton.extended(
        //               onPressed: (){
        //                 _addRow;
        //                 },
        //               label: Text('Add Row'),
        //               backgroundColor: primaryColor,
        //             )]),
        //     ])
//         );
//   }
// }