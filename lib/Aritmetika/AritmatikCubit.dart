import 'package:bloc/bloc.dart';

class Aritmatikcubit extends Cubit<String> {
  //TODO: Mikir caranya jelasin ke pak aji
  //TODO: Selesain sisanya, literally masi WIP :skull:
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
    //sudah jelas dari nama voidnya
    try {
      final hasil = _expEval(_exp);
      emit(hasil.toString());
    } catch (e){
      //gunanya untuk throw error logs ketika ga di recognize
      emit('Error kang');
    }
  }
  double _expEval(String exp) {
    //placholder, kemungkinan tambah fitur klo sempet
    return double.parse(exp);
  }
}

//author: Bumi Bagus Wiraguna