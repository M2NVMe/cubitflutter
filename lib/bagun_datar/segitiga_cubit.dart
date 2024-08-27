import 'package:flutter_bloc/flutter_bloc.dart';

class SegitigaState {
  final double area;

  SegitigaState({required this.area});
}

class SegitigaCubit extends Cubit<SegitigaState> {
  SegitigaCubit() : super(SegitigaState(area: 0));

  void calculate(double base, double height) {
    final double area = 0.5 * base * height;
    emit(SegitigaState(area: area));
  }
}
