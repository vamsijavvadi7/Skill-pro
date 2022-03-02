import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CompetencyId>> fetchIds(http.Client client)  async{
  final response = await http.get(Uri.parse(
      'https://api421.herokuapp.com/fdashboard/competencydetails/surgeon'));

  return compute(parseIds, response.body);
}

List<CompetencyId> parseIds(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  List<CompetencyId> idsList =
      parsed.map<CompetencyId>((json) => CompetencyId.fromJson(json)).toList();
  //print(idsList);
  return idsList;
}

class CompetencyId {
  String competencyname;
  int competencyid;

  CompetencyId({required this.competencyname, required this.competencyid});

  factory CompetencyId.fromJson(Map<String, dynamic> json) {
    return CompetencyId(
        competencyname: json['competencyname'],
        competencyid: json['competencyid']);
  }
}
