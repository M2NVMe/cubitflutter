import 'package:cubitflutter/Aritmetika/AritmatikBloc.dart';
import 'package:cubitflutter/Aritmetika/AritmatikEvent.dart';
import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';
import 'ResultPage.dart';

enum Operator { add, subtract, multiply, divide }

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
      create: (context) => AritmatikBloc(),
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
    final firstNumber = double.tryParse(firstNumberController.text);
    final secondNumber = double.tryParse(secondNumberController.text);

    if (firstNumber != null && secondNumber != null) {
      context.read<AritmatikBloc>().add(Calculate(firstNumber, secondNumber, operator));

      // Navigate to the ResultPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: Invalid input'),
        ),
      );
    }
  }
}
