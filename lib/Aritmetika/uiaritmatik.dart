import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';

enum Operator { add, subtract, multiply, divide }

class AritmatikCubit extends Cubit<String> {
  AritmatikCubit() : super('0') {
    print("AritmatikCubit Initialized");
  }

  setOperator(double firstNumber, double secondNumber, Operator operator) {
    try {
      double result;

      switch (operator) {
        case Operator.add:
          result = firstNumber + secondNumber;
          break;
        case Operator.subtract:
          result = firstNumber - secondNumber;
          break;
        case Operator.multiply:
          result = firstNumber * secondNumber;
          break;
        case Operator.divide:

          if (secondNumber == 0) {
            emit('Error: Division by zero');
            return;
          }
          result = firstNumber / secondNumber;
          break;
      }

      emit(result.toString());
    } catch (e) {
      emit('Error: Invalid operation');
    }
  }
}
class Uiaritmatik extends StatefulWidget {
  const Uiaritmatik({super.key});

  @override
  _UiaritmatikState createState() => _UiaritmatikState();
}

class _UiaritmatikState extends State<Uiaritmatik> {
  final TextEditingController firstNumberController = TextEditingController();
  final TextEditingController secondNumberController = TextEditingController();
  String
  result = '0'; // Initialize result to '0'

  void updateResult(String newResult) {
    setState(() {
      result = newResult;
    });
  }
  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNumberController = TextEditingController();
    final TextEditingController secondNumberController = TextEditingController();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AritmatikCubit()),
      ],
      child: Scaffold(
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
                    final cubit = context.read<AritmatikCubit>();
                    try {
                      double firstNumber = double.parse(firstNumberController.text);
                      double secondNumber = double.parse(secondNumberController.text);
                      cubit.setOperator(firstNumber, secondNumber, Operator.add);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("sukses!"),
                          ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
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
                    final cubit = context.read<AritmatikCubit>();
                    try {
                      final double firstNumber = double.parse(firstNumberController.text);
                      final double secondNumber = double.parse(secondNumberController.text);
                      cubit.setOperator(firstNumber, secondNumber, Operator.subtract);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
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
                    final cubit = context.read<AritmatikCubit>();
                    try {
                      final double firstNumber = double.parse(firstNumberController.text);
                      final double secondNumber = double.parse(secondNumberController.text);
                      cubit.setOperator(firstNumber, secondNumber, Operator.multiply);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
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
                    final cubit = context.read<AritmatikCubit>();
                    try {
                      final double firstNumber = double.parse(firstNumberController.text);
                      final double secondNumber = double.parse(secondNumberController.text);
                      cubit.setOperator(firstNumber, secondNumber, Operator.divide);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
