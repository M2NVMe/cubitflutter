// lib/model/bangun_ruang.dart
class Kubus {
  final double sisi;
  Kubus(this.sisi);

  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok {
  final double panjang;
  final double lebar;
  final double tinggi;
  Balok(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Bola {
  final double jariJari;
  Bola(this.jariJari);

  double volume() {
    return (4 / 3) * 3.14 * jariJari * jariJari * jariJari;
  }
}

