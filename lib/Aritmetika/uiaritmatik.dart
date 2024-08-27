import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';

class Uiaritmatik extends StatelessWidget {
  const Uiaritmatik({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNumberController = TextEditingController();
    final TextEditingController secondNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Kalkulator Aritmatika")),
      body: Column(
        children: [
          myTextField(
            hintText: "1st Number",
            isObscure: false,
            textStyle: TextStyle(fontWeight: FontWeight.normal),
            rad: 10,
            controller: firstNumberController,
          ),
          myTextField(
            hintText: "2nd Number",
            isObscure: false,
            textStyle: TextStyle(fontWeight: FontWeight.normal),
            rad: 10,
            controller: secondNumberController,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: "+",
                onPressed: () {
                  try {
                    double firstNumber = double.parse(firstNumberController.text);
                    double secondNumber = double.parse(secondNumberController.text);
                    context.read<AritmatikCubit>().setOperator(firstNumber, secondNumber, 1);
                    //ada error di context read
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid input. Please enter numbers only."),
                      ),
                    );
                  }
                },
              ),
              myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: "-",
                onPressed: () {
                  try {
                    final double firstNumber = double.parse(firstNumberController.text);
                    final double secondNumber = double.parse(secondNumberController.text);
                    context.read<AritmatikCubit>().setOperator(firstNumber, secondNumber, 2);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid input. Please enter numbers only."),
                      ),
                    );
                  }
                },
              ),
              myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: "*",
                onPressed: () {
                  try {
                    final double firstNumber = double.parse(firstNumberController.text);
                    final double secondNumber = double.parse(secondNumberController.text);
                    context.read<AritmatikCubit>().setOperator(firstNumber, secondNumber, 3);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid input. Please enter numbers only."),
                      ),
                    );
                  }
                },
              ),
              myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: "/",
                onPressed: () {
                  try {
                    final double firstNumber = double.parse(firstNumberController.text);
                    final double secondNumber = double.parse(secondNumberController.text);
                    context.read<AritmatikCubit>().setOperator(firstNumber, secondNumber, 4);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid input. Please enter numbers only."),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
