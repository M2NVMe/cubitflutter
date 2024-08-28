import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';
import 'ResultPage.dart';

enum Operator { add, subtract, multiply, divide }

class AritmatikCubit extends Cubit<String> {
  AritmatikCubit() : super('0') {
    print("AritmatikCubit Initialized");
  }

  void setOperator(double firstNumber, double secondNumber, Operator operator) {
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

  @override
  void dispose() {
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AritmatikCubit(),
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
                    _calculateAndNavigate(context, Operator.add);
                  },
                ),
                myButton(
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 0,
                  textButton: "-",
                  onPressed: () {
                    _calculateAndNavigate(context, Operator.subtract);
                  },
                ),
                myButton(
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 0,
                  textButton: "*",
                  onPressed: () {
                    _calculateAndNavigate(context, Operator.multiply);
                  },
                ),
                myButton(
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 0,
                  textButton: "/",
                  onPressed: () {
                    _calculateAndNavigate(context, Operator.divide);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _calculateAndNavigate(BuildContext context, Operator operator) {
    final cubit = context.read<AritmatikCubit>();
    try {
      final double firstNumber = double.parse(firstNumberController.text);
      final double secondNumber = double.parse(secondNumberController.text);
      cubit.setOperator(firstNumber, secondNumber, operator);

      // Navigate to the ResultPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Invalid input'),
        ),
      );
    }
  }
}
