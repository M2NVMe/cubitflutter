import 'package:bloc/bloc.dart';

class AritmatikCubit extends Cubit<String> {
  //TODO: Mikir caranya jelasin ke pak aji
  //TODO: Selesain sisanya, literally masi WIP :skull:
  AritmatikCubit()  : super('');

  void setOperator(String firstNumber, String secondNumber, String operator) {
    double num1 = double.tryParse(firstNumber) ?? 0;
    double num2 = double.tryParse(secondNumber) ?? 0;
    double result;

    switch (operator) {
      case "+":
        result = num1 + num2;
        break;
      case "-":
        result = num1 - num2;
        break;
      case "*":
        result = num1 * num2;
        break;
      case "/":
        result = num2 != 0 ? num1 / num2 : 0; // Avoid division by zero
        break;
      default:
        result = 0;
    }

    emit(result.toString());
    print(result);
  }
}
//allahuakbar ternyata pake switch case bisa dong :bruh:
//author: Bumi Bagus Wiraguna
