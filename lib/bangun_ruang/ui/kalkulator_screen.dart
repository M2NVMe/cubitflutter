import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/bangun_ruang_cubit.dart';
import '../cubit/bangun_ruang_state.dart';
import 'package:cubitflutter/Reusables/myButton.dart';

class KalkulatorScreen extends StatelessWidget {
  final sisiController = TextEditingController();
  final panjangController = TextEditingController();
  final lebarController = TextEditingController();
  final tinggiController = TextEditingController();
  final jariJariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Ruang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: sisiController,
                decoration: InputDecoration(
                  labelText: 'Sisi Kubus',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: 'Hitung Volume Kubus',
                onPressed: () {
                  final sisi = double.tryParse(sisiController.text);
                  if (sisi != null) {
                    context.read<BangunRuangCubit>().hitungVolumeKubus(sisi);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan angka yang valid untuk sisi kubus!')),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: panjangController,
                decoration: InputDecoration(
                  labelText: 'Panjang Balok',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: lebarController,
                decoration: InputDecoration(
                  labelText: 'Lebar Balok',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: tinggiController,
                decoration: InputDecoration(
                  labelText: 'Tinggi Balok',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: 'Hitung Volume Balok',
                onPressed: () {
                  final panjang = double.tryParse(panjangController.text);
                  final lebar = double.tryParse(lebarController.text);
                  final tinggi = double.tryParse(tinggiController.text);
                  if (panjang != null && lebar != null && tinggi != null) {
                    context.read<BangunRuangCubit>().hitungVolumeBalok(panjang, lebar, tinggi);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan angka yang valid untuk panjang, lebar, dan tinggi balok!')),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: jariJariController,
                decoration: InputDecoration(
                  labelText: 'Jari-jari Bola',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: myButton(
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                radius: 5,
                elevation: 0,
                textButton: 'Hitung Volume Bola',
                onPressed: () {
                  final jariJari = double.tryParse(jariJariController.text);
                  if (jariJari != null) {
                    context.read<BangunRuangCubit>().hitungVolumeBola(jariJari);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan angka yang valid untuk jari-jari bola!')),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: BlocConsumer<BangunRuangCubit, BangunRuangState>(
                listener: (context, state) {
                  if (state is BangunRuangCalculated) {
                    Future.delayed(Duration(seconds: 1), () {
                      context.read<BangunRuangCubit>().emit(BangunRuangInitial());
                    });
                  }
                },
                builder: (context, state) {
                  if (state is BangunRuangCalculated) {
                    return Text('Volume: ${state.volume}');
                  }
                  return Text('Masukkan nilai untuk menghitung volume');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
