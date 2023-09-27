import 'package:flutter/material.dart';
import 'login.dart';
import 'package:flutter/services.dart';
import 'sendotp.dart';
import 'enterotp.dart';
import 'resetpass.dart';
import 'home.dart';
import 'weeklytest.dart';
import 'StudentAttendance.dart';
import 'staffattd.dart';
import 'homework.dart';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // Set the status bar color here
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
     @override
     _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String token = '';

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token') ?? '';
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Admin App",
      home: token != '' ? Home() : Login(),
      routes: {
        '/login': (context) => Login(),
        '/setotp': (context) => SetOtp(),
        '/EnterOTP' : (context) => OtpEntryScreen(),
        '/ResetPass' : (context) => ResetPass(),
        '/home' : (context) => Home(),
        '/weektest' : (context) => WeeklyTest(),
        '/stdAttd' : (context) => StudentAttd(),
        '/staffAttd' : (context) => StaffAttd(),
        '/homework' : (context) => HomeWork(),
        '/profile' : (context) => StudentProfile(),
      },
    );
  }
}