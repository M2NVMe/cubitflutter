import 'package:bloc/bloc.dart';

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
