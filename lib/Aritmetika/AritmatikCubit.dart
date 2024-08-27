import 'package:bloc/bloc.dart';

class AritmatikCubit extends Cubit<String> {
  AritmatikCubit() : super('');

  void setOperator(double firstNumber, double secondNumber, String operator) {
    try {
      double result;

      switch (operator) {
        case "+":
          result = firstNumber + secondNumber;
          break;
        case "-":
          result = firstNumber - secondNumber;
          break;
        case "*":
          result = firstNumber * secondNumber;
          break;
        case "/":
          result = secondNumber != 0 ? firstNumber / secondNumber : 0;
          break;
        default:
          result = 0;
      }

      emit(result.toString());
      print(result);
    } catch (e) {
      // Handle errors, e.g., emit an error message
      emit("Error: $e");
    }
  }
}