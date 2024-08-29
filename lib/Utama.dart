import 'dart:ui';
import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/bagun_datar/bangundatar.dart';
import 'package:cubitflutter/bangun_ruang/ui/kalkulator_screen.dart'; 
import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  // Metode navigasi ke layar Aritmatik

  void _navigateToDatar(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
  }

  void _navigateToRuang(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => KalkulatorScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.all(5),
            child: myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "Aritmatik" ,onPressed: () {},),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "Keliling bangun datar" ,onPressed: () {_navigateToDatar(context);},),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "Keliling bangun ruang" ,onPressed: () {_navigateToRuang(context);},),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "Bilangan Pangkat" ,onPressed: () {},),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
