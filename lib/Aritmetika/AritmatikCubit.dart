import 'package:bloc/bloc.dart';

class Aritmatikcubit extends Cubit<String> {
  //TODO: Mikir caranya jelasin ke pak aji
  //TODO: Selesain sisanya, literally masi WIP :skull:
  Aritmatikcubit()  : super('');
  String? _operation;
  double? _angkapertama;
  double? _angkakedua;

  void setangkapertama(String value) {
    _angkapertama = double.tryParse(value);
  }
  void setangkakedua(String value) {
    _angkakedua = double.tryParse(value);
  }
  void setoperator(String value) {
    _operation = value;
    emit(_operation!);
  }

  void Hitung() {
    if (_angkakedua != null && _angkapertama != null && _operation != null) {
      double hasil;
      switch (_operation) {
        case '+':
          hasil = _angkapertama! + _angkakedua!;
          break;
        case '-':
          hasil = _angkapertama! - _angkakedua!;
          break;
        case '*':
          hasil = _angkapertama! * _angkakedua!;
          break;
        case '/':
          hasil = _angkapertama! / _angkakedua!;
          break;
        default:
          emit('Error');
          return;
      }
      emit(hasil.toString());
    } else {
      emit('Error');
    }
  }

  void clr() {
    _angkapertama = null;
    _angkakedua = null;
    _operation = null;
    emit('');
  }
}
//allahuakbar ternyata pake switch case bisa dong :bruh:
//author: Bumi Bagus Wiraguna