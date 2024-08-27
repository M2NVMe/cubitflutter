import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AritmatikCubit extends Cubit {
  AritmatikCubit() : super('0');

  setOperator(double firstNumber, double secondNumber, double operator) {
    try {
      double result;

      if (operator == 1) {
        result = firstNumber + secondNumber;
      } else if (operator == 2) {
        result = firstNumber - secondNumber;
      } else if (operator == 3) {
        result = firstNumber * secondNumber;
      } else if (operator == 4) {
        result = secondNumber != 0 ? firstNumber / secondNumber : 0;
      } else {
        result = 0;  // Handle unexpected operators
      }

      emit(result.toString());  // Emit the result as double
    } catch (e) {
      // Handle errors, e.g., emit an error value
      emit('0');  // You might want to emit a different value or handle errors differently
    }
  }
}
