import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:firstskillpro/screens/admins/sample_admin.dart';
import '../../login/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<Role> getData(String email) async {
  final response = await http
      .get(Uri.parse('https://api421.herokuapp.com/login/email/$email'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Role.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Role {
  late String name;
 late String role;

  Role({required this.name, required this.role});

  Role.fromJson(Map<String, dynamic> json) {
    name: json['name'] as String;
    role: json['role'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['role'] = role;
    return data;
  }
}
var sp="";

class DetailWidget extends StatefulWidget{
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<DetailWidget> {
  //String email = controller.googleAccount.value?.email ?? '';
  late Future<Role> fetchRole;

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      //controller.googleAccount.value!.email
        fetchRole = getData("vamsijavvadi@gmail.com");
        return FutureBuilder<Role>(
            future: fetchRole,
            builder: (context, snapshot) {
              sp = snapshot.data!.role;
              if (snapshot.hasData) {
                return ListView(
                    children: <Widget>[
                      Text(snapshot.data!.name)
                      ,
                      Text(snapshot.data!.role),
                    ]);

              } else if (snapshot.hasError) {
                return Scaffold(
                    body: Center(child:(Text('${snapshot.error}'))),
                    );

              }
              else{
                return Text("sdsdsds");
              }
            });
      }
    );
  }
  }
