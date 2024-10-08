import 'package:bloc/bloc.dart';
import '../model/bangun_ruang.dart';
import 'bangun_ruang_state.dart';

class BangunRuangCubit extends Cubit<BangunRuangState> {
  BangunRuangCubit() : super(BangunRuangInitial());

  void hitungVolumeKubus(double sisi) {
    final kubus = Kubus(sisi);
    emit(BangunRuangCalculated(kubus.volume()));
  }

  void hitungVolumeBalok(double panjang, double lebar, double tinggi) {
    final balok = Balok(panjang, lebar, tinggi);
    emit(BangunRuangCalculated(balok.volume()));
  }

  void hitungVolumeBola(double jariJari) {
    final bola = Bola(jariJari);
    emit(BangunRuangCalculated(bola.volume()));
  }
}
