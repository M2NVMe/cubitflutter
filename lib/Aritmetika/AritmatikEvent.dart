import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum Operator { add, subtract, multiply, divide }

// Event
abstract class AritmatikEvent extends Equatable {
  const AritmatikEvent();

  @override
  List<Object> get props => [];
}

class Calculate extends AritmatikEvent {
  final double firstNumber;
  final double secondNumber;
  final Operator operator;

  const Calculate(this.firstNumber, this.secondNumber, this.operator);

  @override
  List<Object> get props => [firstNumber, secondNumber, operator];
}

// State
abstract class AritmatikState extends Equatable {
  const AritmatikState();

  @override
  List<Object> get props => [];
}

class AritmatikInitial extends AritmatikState {}

class AritmatikResult extends AritmatikState {
  final String result;

  const AritmatikResult(this.result);

  @override
  List<Object> get props => [result];
}
