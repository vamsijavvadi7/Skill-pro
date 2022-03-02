import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login/login.dart';
import 'screens/faculty/dashboard/dashboard.dart';

void main() async {
  //Initialize the firebase before running the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
    home:LoginWidget(),
    )
  );
}



