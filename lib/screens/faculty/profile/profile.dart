import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/screens/login/login_controller.dart';
import 'edit.dart';
import 'package:firstskillpro/styling.dart';

class FacultyProfile extends StatefulWidget {
  // const FacultyProfile({
  //   Key? key,
  //   required this.controller,
  // }):super(key: key);
  // final LoginController controller;
  @override
  _FacultyProfileState createState() => _FacultyProfileState();
}

class _FacultyProfileState extends State<FacultyProfile> {
  // Color bgColor = Colors.white;
  // bool dark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: bgColor,
      //   elevation: 0,
      //   actions: <Widget>[
      //     ElevatedButton(
      //       style: ElevatedButton.styleFrom(primary: bgColor),
      //         onPressed: () {
      //           dark = !dark;
      //           if (dark) {
      //             setState(() {
      //               bgColor = Colors.black;
      //             });
      //           } else {
      //             setState(() {
      //               bgColor = Colors.white;
      //             });
      //           }
      //         },
      //         child: Icon(Icons.light_mode_outlined,color: secondaryColor,))
      //   ],
      // ),
      
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getHeader(),
            SizedBox(
              height: 5,
            ),
            _profileName("Jyothi Adabala"),
            Divider(
              height: 10,
            ),
            _heading("Personal Details"),
            SizedBox(
              height: 6,
            ),
            _detailsCard(),
            SizedBox(
              height: 10,
            ),
            _heading("Settings"),
            SizedBox(
              height: 6,
            ),
            _settingsCard(),
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
            child: CircleAvatar(
              child: Text('a'),
              radius: 40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(name, style: GoogleFonts.baloo(fontSize: 24)),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.email),
              title: Text("jyothi@gmail.com", style: poppins),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone_android_rounded),
              title: Text("1234567890", style: poppins),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.badge_rounded),
              title: Text("2018 - 2022", style: poppins),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.edit,
              ),
              title: Text('Edit', style: poppins),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Edit()));
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text("About", style: poppins),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("Logout", style: poppins),
              onTap: () {
                controller.logout();
              },
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }
}
