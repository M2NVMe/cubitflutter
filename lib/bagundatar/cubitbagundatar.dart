import 'package:bloc/bloc.dart';

class BagundatarCubit extends Cubit<String> {
  BagundatarCubit() : super("");

  void hitungPersegi(String sisi) {
    double s = double.tryParse(sisi) ?? 0;
    double luas = s * s;
    double keliling = 4 * s;
    emit("Luas Persegi: $luas, Keliling Persegi: $keliling");
  }

  void hitungPersegiPanjang(String panjang, String lebar) {
    double p = double.tryParse(panjang) ?? 0;
    double l = double.tryParse(lebar) ?? 0;
    double luas = p * l;
    double keliling = 2 * (p + l);
    emit("Luas Persegi Panjang: $luas, Keliling Persegi Panjang: $keliling");
  }

  void hitungLingkaran(String jariJari) {
    double r = double.tryParse(jariJari) ?? 0;
    double luas = 3.14 * r * r;
    double keliling = 2 * 3.14 * r;
    emit("Luas Lingkaran: $luas, Keliling Lingkaran: $keliling");
  }
}
