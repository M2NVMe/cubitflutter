import 'package:bloc/bloc.dart';

class Aritmatikcubit extends Cubit<String> {
  Aritmatikcubit()  : super('');

  String _exp = '';
  void input(String val) {
    _exp  += val;
    emit(_exp);
  }
  void clear() {
    _exp  = '';
    emit(_exp);
  }
  void hitung() {
    try {
      final hasil = _expEval(_exp);
      emit(hasil.toString());
    } catch (e){
      emit('Error kang');
    }
  }
  double _expEval(String exp) {
    return double.parse(exp);
  }
}