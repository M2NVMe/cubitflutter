import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kalkulator_state.dart';

class KalkulatorCubit extends Cubit<KalkulatorState> {
  KalkulatorCubit() : super(KalkulatorInitial());
}
