import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:firstskillpro/screens/faculty/dashboard/id.dart';
import 'package:firstskillpro/screens/faculty/evaluationForm/eval_form.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:firstskillpro/screens/faculty/dashboard/get_details.dart';
import '../../../styling.dart';
import '../../login/login_controller.dart';
import 'package:get/get.dart';
import 'competencies.dart';

class Competencies {
  String name;
  String regno;
  int self;
  int faculty;
  int competencynum;
  String competencyname;

  Competencies(
      {required this.name,
        required this.regno,
        required this.self,
        required this.faculty,
        required this.competencynum,
        required this.competencyname});

  factory Competencies.fromJson(Map<String, dynamic> json) {
    return Competencies(
        name: json['name'] as String,
        regno: json['regno'] as String,
        self: json['self'] as int,
        faculty: json['faculty'] as int,
        competencynum: json['competencynum'] as int,
        competencyname: json['competencyname'] as String);
  }
}

List<Competencies> parseCompetencies(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<Competencies> competenciesList =
  parsed.map<Competencies>((json) => Competencies.fromJson(json)).toList();
  return competenciesList;
}


//GridView to display the data as table
List<GridColumn> getColumn() {
  return <GridColumn>[
    GridColumn(
      columnWidthMode: ColumnWidthMode.auto,
      columnName: 'RegNo',
      label: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text('RegNo', style: poppins),
      ),
    ),
    GridColumn(
      columnName: 'Name',
      label: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          'Name',
          style: poppins,
        ),
      ),
    ),
    GridColumn(
      columnName: 'Self',
      label: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          'Self',
          style: poppins,
        ),
      ),
    ),
    GridColumn(
      columnName: 'Faculty',
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          'Faculty',
          style: poppins,
        ),
      ),
    ),
  ];
}

class CompetenciesDataGridSource extends DataGridSource {
  CompetenciesDataGridSource(this.competenciesList) {
    buildDataGridRow();
  }
  late List<Competencies> competenciesList;
  late List<DataGridRow> dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(color: Colors.white, cells: [
      Text(
        row.getCells()[0].value,
        style: poppins,
      ),
      Text(
        row.getCells()[1].value,
        style: poppins,
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          row.getCells()[2].value.toString(),
          style: poppins,
        ),
      ),
      Text(
        row.getCells()[3].value.toString(),
        style: poppins,
      ),
    ]);
  }

  @override
  // TODO: implement rows
  List<DataGridRow> get rows => dataGridRows;
  void buildDataGridRow() {
    dataGridRows = competenciesList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'RegNo', value: dataGridRow.regno),
        DataGridCell<String>(columnName: 'Name', value: dataGridRow.name),
        DataGridCell<int>(columnName: 'Self', value: dataGridRow.self),
        DataGridCell<int>(columnName: 'Faculty', value: dataGridRow.faculty),
      ]);
    }).toList(growable: true);
  }
}

class Extra extends StatelessWidget {

  final int i;
  Extra({Key key,@required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar : AppBar(
        title : Text("CompetencyName")
      ),
        body :Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child:Column(
                  children:<Widget>[
                      FutureBuilder(
                        future: getCompetenciesGridSource(4),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                                child: ListView(
                                  physics: ScrollPhysics(),
                                  padding: const EdgeInsets.all(2),
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0.0, 5, 0.0, 5),
                                        color: secondaryColor,
                                        child: Column(
                                          children: <Widget>[
                                            SfDataGrid(
                                                columnWidthMode: ColumnWidthMode.fill,
                                                allowSorting: true,
                                                source: snapshot.data,
                                                verticalScrollPhysics: NeverScrollableScrollPhysics(),
                                                columns: getColumn())
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                  ],
                )),
          ],
        ));
  }
}
