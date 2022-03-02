import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/screens/login/login_controller.dart';
class GetFacultyDetails extends StatefulWidget {
  const GetFacultyDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

  @override
  State<GetFacultyDetails> createState() => _GetFacultyDetailsState();
}

class _GetFacultyDetailsState extends State<GetFacultyDetails> {
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
                      Text(
                        'Name: ${widget.controller.googleAccount.value?.displayName ?? ''}',
                        style: GoogleFonts.poppins(),
                      ),
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
                          Text(
                            'Role: Surgeon',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(),
                          ),
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
