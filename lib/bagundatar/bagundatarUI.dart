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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                context
                    .read<BagundatarCubit>()
                    .hitungPersegi(sisiController.text);
              },
            ),
            SizedBox(height: 16),
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
                context.read<BagundatarCubit>().hitungPersegiPanjang(
                      panjangController.text,
                      lebarController.text,
                    );
              },
            ),
            SizedBox(height: 16),
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
                context
                    .read<BagundatarCubit>()
                    .hitungLingkaran(jariJariController.text);
              },
            ),
            SizedBox(height: 16),
            BlocBuilder<BagundatarCubit, String>(
              builder: (context, state) {
                return Text(
                  state.isNotEmpty
                      ? state
                      : 'Masukkan nilai untuk menghitung luas dan keliling',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
