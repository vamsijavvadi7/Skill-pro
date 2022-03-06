import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Role> fetchRole() async {

  final response = await http
      .get(Uri.parse('https://api421.herokuapp.com/fdashboard/details/jyothiadabala321@gmail.com'));

  if (response.statusCode == 200) {

    return Role.fromJson(json.decode(response.body));

  } else {

    throw Exception('Failed to load album');

  }
}

class Role {

  final String name;
  final String speciality;

  Role({required this.name, required this.speciality});


  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json['name'],
      speciality: json['speciality'],
    );

  }
}
// var tmp = "";

class DetailWidget extends StatefulWidget {

  const DetailWidget({Key? key}) : super(key: key);

  @override

  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<DetailWidget> {

  late Future<Role> futureRole;
  @override

  void initState() {

    super.initState();
    futureRole = fetchRole();
  }

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),

      home: Scaffold(

        body: Center(
          child: FutureBuilder<Role>(
            future: futureRole,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // tmp = snapshot.data!.name;
                return Column(
                    children:<Widget>[
                      Text(snapshot.data!.name),
                      Text(snapshot.data!.speciality),
                    ]
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
