// This file will run after the successful login of the faculty
// It contains three main widgets, they are 1.Profile 2. Dashboard 3.To-Do

import 'package:flutter/material.dart';
import 'package:firstskillpro/styling.dart';
import 'dashboard/dashboard.dart';
import 'profile/profile.dart';
import 'todo/to_do.dart';

class FacultyLoggedIn extends StatefulWidget {
  // final Future<String> role;
  // const facultyLoggedIn(this.role);
  const FacultyLoggedIn({Key? key}) : super(key: key);

  @override
  _FacultyLoggedInState createState() => _FacultyLoggedInState();
}

class _FacultyLoggedInState extends State<FacultyLoggedIn> {
  int currentIndex = 1;
  final tabs = [
    FacultyProfile(), //Use 'FacultyProfile(controller: controller),' to get user details from LoginController.
    const FacultyDashBoard(),
    const FacultyToDo(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
            child: BottomNavigationBar(
              selectedLabelStyle: poppins,
              currentIndex: currentIndex,
              onTap: (index) => setState(() {
                currentIndex = index;
              }),
              type: BottomNavigationBarType.shifting,
              unselectedItemColor: Colors.blueGrey,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: 'Profile',
                  backgroundColor: primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_rounded),
                  label: 'Dashboard',
                  backgroundColor: primaryColor,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pending_actions_rounded),
                  label: 'To do',
                  backgroundColor: primaryColor,
                ),
              ],
            ),
          ),
          body: tabs[currentIndex],
        ),
      );
  }
}
