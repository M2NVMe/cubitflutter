import 'package:cubitflutter/Pangkat/perpangkatanCubit.dart';
import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerpangkatanUI extends StatelessWidget {
  const PerpangkatanUI({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController primaryNumberController = TextEditingController();
    final TextEditingController exponentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Kalkulator Perpangkatan"),
      ),
      body: BlocProvider(
        create: (_) => PerpangkatanCubit(),
        child: BlocBuilder<PerpangkatanCubit, String>(
          builder: (context, result) {
            return Column(
              children: [
                Expanded(child: Container()),
                Column(
                  children: [
                    myTextField(
                      hintText: "Primary Number",
                      isObscure: false,
                      textStyle: TextStyle(fontWeight: FontWeight.normal),
                      rad: 10,
                      controller: primaryNumberController,
                    ),
                    myTextField(
                      hintText: "Exponent Number",
                      isObscure: false,
                      textStyle: TextStyle(fontWeight: FontWeight.normal),
                      rad: 10,
                      controller: exponentController,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                myButton(
                  textButton: "Calculate",
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  radius: 5,
                  elevation: 0,
                  onPressed: () {
                    String base = primaryNumberController.text;
                    String exponent = exponentController.text;
                    context.read<PerpangkatanCubit>().calculateExponentiation(base, exponent);
                  },
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 24),
                ),
                Expanded(child: Container()),
              ],
            );
          },
        ),
      ),
    );
  }
}
