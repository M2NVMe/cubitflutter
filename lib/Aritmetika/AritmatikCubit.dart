import 'package:bloc/bloc.dart';

class Aritmatikcubit extends Cubit<String> {
  //TODO: Mikir caranya jelasin ke pak aji
  //TODO: Selesain sisanya, literally masi WIP :skull:
  Aritmatikcubit()  : super('');
  void setoperator(String firstNumber, String secondNumber, String operator) {
    double num1 = double.tryParse(firstNumber) ?? 0;
    double num2 = double.tryParse(secondNumber) ?? 0;
    double result;

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num2 != 0 ? num1 / num2 : 0;
        break;
      default:
        result = 0;
    }

    emit(result.toString());
  }

  void clear() {
    emit('');
  }
}
//allahuakbar ternyata pake switch case bisa dong :bruh:
//author: Bumi Bagus Wiraguna