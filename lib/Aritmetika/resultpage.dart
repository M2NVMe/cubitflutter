import 'package:cubitflutter/Aritmetika/AritmatikBloc.dart';
import 'package:cubitflutter/Aritmetika/AritmatikEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AritmatikCubit.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
        child: BlocBuilder<AritmatikBloc, AritmatikState>(
          builder: (context, state) {
            if (state is AritmatikResult) {
              return Text(
                state.result,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              );
            }
            return CircularProgressIndicator();  // Default state while calculating
          },
        ),
      ),
    );
  }
}
