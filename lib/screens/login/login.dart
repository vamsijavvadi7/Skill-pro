import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firstskillpro/screens/admins/sample_admin.dart';
import 'package:firstskillpro/styling.dart';
import 'login_controller.dart';
import 'package:get/get.dart';
import '../build_login.dart';
import '../faculty/logged_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String? status;
  String? role;

  Role({this.status, this.role});

  Role.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['role'] = role;
    return data;
  }
}


class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //String email = controller.googleAccount.value?.email ?? '';
  late Future<Role> fetchRole;

  @override
  Widget build(BuildContext context) {
    // Write a condition to check whether the email is in our local DB or not
    // If yes, then return the user type Ex:Faculty, Student, admin
    // Based on the user type we should return the dashboard screen
    // Use API to know the user role.
    // Command to get the user Email id : String email = controller.googleAccount.value?.email ?? '';
    return Obx(() {
      if (controller.googleAccount.value == null) {
        return const BuildLogin();
      } else {
        if (controller.googleAccount.value!.email != '') {
          fetchRole = getData(controller.googleAccount.value!.email);
          return FutureBuilder<Role>(
            future: fetchRole,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.role == 'faculty' &&
                    snapshot.data!.status == 'True') {
                  return const FacultyLoggedIn();
                }
                else if(snapshot.data!.role == 'admin' &&
                    snapshot.data!.status == 'True') {
                  return const SampleAdmin();
                }
                else {
                  controller.logout();
                }
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default Login Screen
              return const BuildLogin();
            },
          );
        }
      }
      return BuildLogin();
    });
  }
}
