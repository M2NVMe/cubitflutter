import 'package:bloc/bloc.dart';
import 'dart:math';

class PerpangkatanCubit extends Cubit<String> {
  PerpangkatanCubit() : super("");

  void calculateExponentiation(String base, String exponent) {
    try {
      double baseNumber = double.parse(base);
      double exponentNumber = double.parse(exponent);
      double result = pow(baseNumber, exponentNumber) as double;
      emit(result.toString());
    } catch (e) {
      emit("Error: Invalid input");
    }
  }
}
