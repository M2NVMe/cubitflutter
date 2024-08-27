import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';

class Uiaritmatik extends StatelessWidget {
  const Uiaritmatik({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNumberController = TextEditingController();
    final TextEditingController secondNumberController = TextEditingController();
    return Scaffold(
      appBar:AppBar(title: Text("Kalkulator Aritmatika"),),
      body:
      Column(
        children: [
          Expanded(child: Container()),
          myTextField(hintText: "1st Number", isObscure: false, textStyle: TextStyle(fontWeight: FontWeight.normal), rad: 10, controller: firstNumberController),
          myTextField(hintText: "2nd  Number", isObscure: false, textStyle: TextStyle(fontWeight: FontWeight.normal), rad: 10, controller: secondNumberController,),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(child: Container()),
              myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "+" ,onPressed: () {
                context.read<Aritmatikcubit>().setoperator(
                  firstNumberController.text,
                  secondNumberController.text,
                  "+",
                );
              },),
              myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "-" ,onPressed: () {
                context.read<Aritmatikcubit>().setoperator(
                  firstNumberController.text,
                  secondNumberController.text,
                  "-",
                );
              },),
              myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "*" ,onPressed: () {
                context.read<Aritmatikcubit>().setoperator(
                  firstNumberController.text,
                  secondNumberController.text,
                  "*",
                );
              },),
              myButton(backgroundColor: Colors.black45, textColor: Colors.white, radius: 5,elevation: 0, textButton: "/" ,onPressed: () {
                context.read<Aritmatikcubit>().setoperator(
                  firstNumberController.text,
                  secondNumberController.text,
                  "/",
                );
              },),
              Expanded(child: Container()),
            ],
          ),
          Expanded(child: Container()),
          BlocBuilder<Aritmatikcubit, String>(
            builder: (context, result) {
              return Text(
                result,
                style: TextStyle(fontSize: 20),
              );
            },
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
