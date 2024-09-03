import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BagundatarState {}

class BagundatarInitial extends BagundatarState {}

class BagundatarCalculated extends BagundatarState {
  final double luasPersegi;
  final double kelilingPersegi;
  final double luasPersegiPanjang;
  final double kelilingPersegiPanjang;
  final double luasLingkaran;
  final double kelilingLingkaran;

  BagundatarCalculated({
    required this.luasPersegi,
    required this.kelilingPersegi,
    required this.luasPersegiPanjang,
    required this.kelilingPersegiPanjang,
    required this.luasLingkaran,
    required this.kelilingLingkaran,
  });
}

class BagundatarCubit extends Cubit<BagundatarState> {
  BagundatarCubit() : super(BagundatarInitial());

  void hitungPersegi(double sisi) {
    final luas = sisi * sisi;
    final keliling = 4 * sisi;

    final currentState = state;
    emit(BagundatarCalculated(
      luasPersegi: luas,
      kelilingPersegi: keliling,
      luasPersegiPanjang: currentState is BagundatarCalculated
          ? currentState.luasPersegiPanjang
          : 0,
      kelilingPersegiPanjang: currentState is BagundatarCalculated
          ? currentState.kelilingPersegiPanjang
          : 0,
      luasLingkaran:
          currentState is BagundatarCalculated ? currentState.luasLingkaran : 0,
      kelilingLingkaran: currentState is BagundatarCalculated
          ? currentState.kelilingLingkaran
          : 0,
    ));
  }

  void hitungPersegiPanjang(double panjang, double lebar) {
    final luas = panjang * lebar;
    final keliling = 2 * (panjang + lebar);

    final currentState = state;
    emit(BagundatarCalculated(
      luasPersegi:
          currentState is BagundatarCalculated ? currentState.luasPersegi : 0,
      kelilingPersegi: currentState is BagundatarCalculated
          ? currentState.kelilingPersegi
          : 0,
      luasPersegiPanjang: luas,
      kelilingPersegiPanjang: keliling,
      luasLingkaran:
          currentState is BagundatarCalculated ? currentState.luasLingkaran : 0,
      kelilingLingkaran: currentState is BagundatarCalculated
          ? currentState.kelilingLingkaran
          : 0,
    ));
  }

  void hitungLingkaran(double jariJari) {
    final luas = 3.14 * jariJari * jariJari;
    final keliling = 2 * 3.14 * jariJari;

    final currentState = state;
    emit(BagundatarCalculated(
      luasPersegi:
          currentState is BagundatarCalculated ? currentState.luasPersegi : 0,
      kelilingPersegi: currentState is BagundatarCalculated
          ? currentState.kelilingPersegi
          : 0,
      luasPersegiPanjang: currentState is BagundatarCalculated
          ? currentState.luasPersegiPanjang
          : 0,
      kelilingPersegiPanjang: currentState is BagundatarCalculated
          ? currentState.kelilingPersegiPanjang
          : 0,
      luasLingkaran: luas,
      kelilingLingkaran: keliling,
    ));
  }
}
