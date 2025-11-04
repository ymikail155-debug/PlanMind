import 'dart:async';
import 'package:flutter/material.dart';
import 'language_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LanguageScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 96, height: 96,
              decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(18)),
              child: Center(child: Text('PM', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))),
            ),
            SizedBox(height: 16),
            Text('PlanMind', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Akıllı yaşam asistanın.', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}