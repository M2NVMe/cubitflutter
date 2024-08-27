import 'package:flutter_bloc/flutter_bloc.dart';

class PersegiState {
  final double area;
  final double perimeter;

  PersegiState({required this.area, required this.perimeter});
}

class PersegiCubit extends Cubit<PersegiState> {
  PersegiCubit() : super(PersegiState(area: 0, perimeter: 0));

  void calculate(double side) {
    final double area = side * side;
    final double perimeter = 4 * side;
    emit(PersegiState(area: area, perimeter: perimeter));
  }
}
