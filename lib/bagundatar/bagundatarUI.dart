import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubitbagundatar.dart';

class BagundatarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Datar'),
      ),
      body: BagundatarForm(),
    );
  }
}

class BagundatarForm extends StatelessWidget {
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();
  final TextEditingController jariJariController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input for Persegi
            TextField(
              controller: sisiController,
              decoration: InputDecoration(
                labelText: 'Sisi Persegi',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final sisi = double.tryParse(sisiController.text) ?? 0;
                context.read<BagundatarCubit>().hitungPersegi(sisi);
              },
              child: Text('Hitung Luas & Keliling Persegi'),
            ),
            SizedBox(height: 16),

            // Input for Persegi Panjang
            TextField(
              controller: panjangController,
              decoration: InputDecoration(
                labelText: 'Panjang Persegi Panjang',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            TextField(
              controller: lebarController,
              decoration: InputDecoration(
                labelText: 'Lebar Persegi Panjang',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final panjang = double.tryParse(panjangController.text) ?? 0;
                final lebar = double.tryParse(lebarController.text) ?? 0;
                context
                    .read<BagundatarCubit>()
                    .hitungPersegiPanjang(panjang, lebar);
              },
              child: Text('Hitung Luas & Keliling Persegi Panjang'),
            ),
            SizedBox(height: 16),

            // Input for Lingkaran
            TextField(
              controller: jariJariController,
              decoration: InputDecoration(
                labelText: 'Jari-jari Lingkaran',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final jariJari = double.tryParse(jariJariController.text) ?? 0;
                context.read<BagundatarCubit>().hitungLingkaran(jariJari);
              },
              child: Text('Hitung Luas & Keliling Lingkaran'),
            ),
            SizedBox(height: 16),

            // Result Display
            BlocBuilder<BagundatarCubit, BagundatarState>(
              builder: (context, state) {
                if (state is BagundatarCalculated) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.luasPersegi != 0) ...[
                        Text('Luas Persegi: ${state.luasPersegi}'),
                        Text('Keliling Persegi: ${state.kelilingPersegi}'),
                      ],
                      if (state.luasPersegiPanjang != 0) ...[
                        Text(
                            'Luas Persegi Panjang: ${state.luasPersegiPanjang}'),
                        Text(
                            'Keliling Persegi Panjang: ${state.kelilingPersegiPanjang}'),
                      ],
                      if (state.luasLingkaran != 0) ...[
                        Text('Luas Lingkaran: ${state.luasLingkaran}'),
                        Text('Keliling Lingkaran: ${state.kelilingLingkaran}'),
                      ],
                    ],
                  );
                }
                return Text(
                    'Masukkan nilai untuk menghitung luas dan keliling');
              },
            ),
          ],
        ),
      ),
    );
  }
}
