import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BagundatarState {}

class BagundatarInitial extends BagundatarState {}

class BagundatarCalculated extends BagundatarState {
  final double luasPersegi;
  final double kelilingPersegi;
  final double luasPersegiPanjang;
  final double kelilingPersegiPanjang;

  BagundatarCalculated({
    required this.luasPersegi,
    required this.kelilingPersegi,
    required this.luasPersegiPanjang,
    required this.kelilingPersegiPanjang,
  });
}

class BagundatarCubit extends Cubit<BagundatarState> {
  BagundatarCubit() : super(BagundatarInitial());

  void hitungPersegi(double sisi) {
    final luas = sisi * sisi;
    final keliling = 4 * sisi;
    emit(BagundatarCalculated(
      luasPersegi: luas,
      kelilingPersegi: keliling,
      luasPersegiPanjang: (state is BagundatarCalculated) ? (state as BagundatarCalculated).luasPersegiPanjang : 0,
      kelilingPersegiPanjang: (state as BagundatarCalculated).kelilingPersegiPanjang,
    ));
  }

  void hitungPersegiPanjang(double panjang, double lebar) {
    final luas = panjang * lebar;
    final keliling = 2 * (panjang + lebar);
    emit(BagundatarCalculated(
      luasPersegi: (state is BagundatarCalculated) ? (state as BagundatarCalculated).luasPersegi : 0,
      kelilingPersegi: (state as BagundatarCalculated).kelilingPersegi,
      luasPersegiPanjang: luas,
      kelilingPersegiPanjang: keliling,
    ));
  }
}
