// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CompetencyTableDetails CompetencyTableDetailsFromJson(String str) => CompetencyTableDetails.fromJson(json.decode(str));

String CompetencyTableDetailsToJson(CompetencyTableDetails data) => json.encode(data.toJson());

class CompetencyTableDetails {
  CompetencyTableDetails({
    // required this.compentencyevaluationid,
    required this.patientop,
    required this.date,
    required this.time,
    // required this.self,
    // required this.faculty,
  });

  // int compentencyevaluationid;
  String patientop;
  String date;
  String time;
  // int self;
  // int faculty;

  factory CompetencyTableDetails.fromJson(Map<String, dynamic> json) => CompetencyTableDetails(
    // compentencyevaluationid: json["compentencyevaluationid"],
    patientop: json["patientop"],
    date: json["date"],
    time: json["time"],
    // self: json["self"],
    // faculty: json["faculty"],
  );

  Map<String, dynamic> toJson() => {
    // "compentencyevaluationid": compentencyevaluationid,
    "patientop": patientop,
    "date": date,
    "time": time,
    // "self": self,
    // "faculty": faculty,
  };
}
