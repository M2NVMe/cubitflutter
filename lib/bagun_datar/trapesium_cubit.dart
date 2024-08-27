import 'package:flutter_bloc/flutter_bloc.dart';

class TrapesiumState {
  final double area;

  TrapesiumState({required this.area});
}

class TrapesiumCubit extends Cubit<TrapesiumState> {
  TrapesiumCubit() : super(TrapesiumState(area: 0));

  void calculate(double baseA, double baseB, double height) {
    final double area = 0.5 * (baseA + baseB) * height;
    emit(TrapesiumState(area: area));
  }
}
