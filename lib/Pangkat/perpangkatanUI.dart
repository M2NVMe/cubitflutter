import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class perpangkatanUI extends StatelessWidget {
  const perpangkatanUI({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController PrimaryNumber = TextEditingController();
    final TextEditingController Exponent = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalulator Perpangkatan"),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(child: Container()),
              myTextField(hintText: "Primary Number", isObscure: false, textStyle: TextStyle(fontWeight: FontWeight.normal), rad: 10, controller: PrimaryNumber),
              myTextField(hintText: "Exponent Number", isObscure: false, textStyle: TextStyle(fontWeight: FontWeight.normal), rad: 10, controller: Exponent),
              Expanded(child: Container()),
            ],
          ),
          SizedBox(height: 20),
          myButton(textButton: "calculate", backgroundColor: Colors.black45, textColor: Colors.white, radius: 5, elevation: 0, onPressed: () {

          }),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
