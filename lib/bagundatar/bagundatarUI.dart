import 'package:cubitflutter/Reusables/myButton.dart';
import 'package:cubitflutter/Reusables/myTextfield.dart';
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
            myTextField(
              hintText: "Sisi Persegi",
              isObscure: false,
              textStyle: TextStyle(fontWeight: FontWeight.normal),
              rad: 10,
              controller: sisiController,
            ),
            SizedBox(height: 16),
            myButton(
              textButton: "Hitung Luas & Keliling Persegi",
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              radius: 5,
              elevation: 0,
              onPressed: () {
                final sisi = double.tryParse(sisiController.text) ?? 0;
                context.read<BagundatarCubit>().hitungPersegi(sisi);
              },
            ),
            SizedBox(height: 16),

            // Input for Persegi Panjang
            myTextField(
              hintText: "Panjang Persegi Panjang",
              isObscure: false,
              textStyle: TextStyle(fontWeight: FontWeight.normal),
              rad: 10,
              controller: panjangController,
            ),
            SizedBox(height: 16),
            myTextField(
              hintText: "Lebar Persegi Panjang",
              isObscure: false,
              textStyle: TextStyle(fontWeight: FontWeight.normal),
              rad: 10,
              controller: lebarController,
            ),
            SizedBox(height: 16),
            myButton(
              textButton: "Hitung Luas & Keliling Persegi Panjang",
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              radius: 5,
              elevation: 0,
              onPressed: () {
                final panjang = double.tryParse(panjangController.text) ?? 0;
                final lebar = double.tryParse(lebarController.text) ?? 0;
                context
                    .read<BagundatarCubit>()
                    .hitungPersegiPanjang(panjang, lebar);
              },
            ),
            SizedBox(height: 16),

            // Input for Lingkaran
            myTextField(
              hintText: "Jari Jari Lingkaran",
              isObscure: false,
              textStyle: TextStyle(fontWeight: FontWeight.normal),
              rad: 10,
              controller: jariJariController,
            ),
            SizedBox(height: 16),
            myButton(
              textButton: "Hitung Luas & Keliling Lingkaran",
              backgroundColor: Colors.grey,
              textColor: Colors.black,
              radius: 5,
              elevation: 0,
              onPressed: () {
                final jariJari = double.tryParse(jariJariController.text) ?? 0;
                context.read<BagundatarCubit>().hitungLingkaran(jariJari);
              },
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
