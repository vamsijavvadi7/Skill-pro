import 'dart:async';
import 'dart:convert';
import 'package:firstskillpro/styling.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/screens/login/login_controller.dart';

Future<Role> fetchRole(String email) async {

  final response = await http
      .get(Uri.parse('https://api421.herokuapp.com/fdashboard/details/${email}'));

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

class DetailWidget extends StatefulWidget {

  const DetailWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override

  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<DetailWidget> {

  late Future<Role> futureRole;
  @override

  void initState() {
    var em = widget.controller.googleAccount.value?.email;
    super.initState();
    futureRole = fetchRole(em.toString());
  }

  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 10 ,0),
                    child: CircleAvatar(
                      backgroundImage: Image.network(
                          widget.controller.googleAccount.value?.photoUrl ?? '')
                          .image,
                      radius: 35,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FutureBuilder<Role>(
                          future: futureRole,
                          builder: (ctx, snapshot) {
                            // Checking if future is resolved or not
                            if (snapshot.connectionState == ConnectionState.done) {
                              // If we got an error
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    'Empty',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );
                              } else if (snapshot.hasData) {
                                // Extracting data from snapshot object
                                final data = snapshot.data!.name;
                                return Center(
                                  child: Text(
                                    'Name : $data',
                                    style: poppins,
                                  ),
                                );
                              }
                            }

                            // Displaying LoadingSpinner to indicate waiting state
                            return Center(
                              child: CircularProgressIndicator(),
                            );

                          }),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email: ${widget.controller.googleAccount.value?.email ?? ''}',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          FutureBuilder<Role>(
                              future: futureRole,
                              builder: (ctx, snapshot) {
                                // Checking if future is resolved or not
                                if (snapshot.connectionState == ConnectionState.done) {
                                  // If we got an error
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        'Empty',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    );
                                  } else if (snapshot.hasData) {
                                    // Extracting data from snapshot object
                                    tmp = snapshot.data!.speciality;
                                    return Center(
                                      child: Text(
                                        'Role : $tmp',
                                        style: poppins,
                                      ),
                                    );
                                  }
                                }

                                // Displaying LoadingSpinner to indicate waiting state
                                return Center(
                                  child: CircularProgressIndicator(),
                                );

                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
