import 'package:flutter_bloc/flutter_bloc.dart';

class LingkaranState {
  final double area;
  final double circumference;

  LingkaranState({required this.area, required this.circumference});
}

class LingkaranCubit extends Cubit<LingkaranState> {
  LingkaranCubit() : super(LingkaranState(area: 0, circumference: 0));

  void calculate(double radius) {
    final double area = 3.14 * radius * radius;
    final double circumference = 2 * 3.14 * radius;
    emit(LingkaranState(area: area, circumference: circumference));
  }
}
