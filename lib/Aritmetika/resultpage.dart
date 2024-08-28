import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: BlocBuilder<AritmatikCubit, String>(
          builder: (context, result) {
            return Text(
              result,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
