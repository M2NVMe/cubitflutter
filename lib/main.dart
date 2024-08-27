import 'package:cubitflutter/Utama.dart';
import 'package:cubitflutter/bangun_ruang/brcubit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelompok 8',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const mainPage(),
    );
  }
}

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
          children: [
            TextField(
              controller: sisiController,
              decoration: InputDecoration(labelText: 'Sisi Kubus'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final sisi = double.tryParse(sisiController.text) ?? 0;
                context.read<BangunRuangCubit>().hitungVolumeKubus(sisi);
              },
              child: Text('Hitung Volume Kubus'),
            ),
            TextField(
              controller: panjangController,
              decoration: InputDecoration(labelText: 'Panjang Balok'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: lebarController,
              decoration: InputDecoration(labelText: 'Lebar Balok'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tinggiController,
              decoration: InputDecoration(labelText: 'Tinggi Balok'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final panjang = double.tryParse(panjangController.text) ?? 0;
                final lebar = double.tryParse(lebarController.text) ?? 0;
                final tinggi = double.tryParse(tinggiController.text) ?? 0;
                context.read<BangunRuangCubit>().hitungVolumeBalok(panjang, lebar, tinggi);
              },
              child: Text('Hitung Volume Balok'),
            ),
            TextField(
              controller: jariJariController,
              decoration: InputDecoration(labelText: 'Jari-jari Bola'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                final jariJari = double.tryParse(jariJariController.text) ?? 0;
                context.read<BangunRuangCubit>().hitungVolumeBola(jariJari);
              },
              child: Text('Hitung Volume Bola'),
            ),
            BlocBuilder<BangunRuangCubit, BangunRuangState>(
              builder: (context, state) {
                if (state is BangunRuangCalculated) {
                  return Text('Volume: ${state.volume}');
                }
                return Text('Masukkan nilai untuk menghitung volume');
              },
            ),
          ],
        ),
      ),
    );
  }
}