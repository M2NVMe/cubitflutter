import 'package:bloc/bloc.dart';
import 'package:cubitflutter/Aritmetika/AritmatikEvent.dart';

enum Operator { add, subtract, multiply, divide }

class AritmatikBloc extends Bloc<AritmatikEvent, AritmatikState> {
  AritmatikBloc() : super(AritmatikInitial()) {
    print("AritmatikBloc Initialized");
  }

  @override
  Stream<AritmatikState> mapEventToState(AritmatikEvent event) async* {
    if (event is Calculate) {
      try {
        double result;

        switch (event.operator) {
          case Operator.add:
            result = event.firstNumber + event.secondNumber;
            break;
          case Operator.subtract:
            result = event.firstNumber - event.secondNumber;
            break;
          case Operator.multiply:
            result = event.firstNumber * event.secondNumber;
            break;
          case Operator.divide:
            if (event.secondNumber == 0) {
              yield AritmatikResult('Error: Division by zero');
              return;
            }
            result = event.firstNumber / event.secondNumber;
            break;
        }

        yield AritmatikResult(result.toString());
      } catch (e) {
        yield AritmatikResult('Error: Invalid operation');
      }
    }
  }
}
