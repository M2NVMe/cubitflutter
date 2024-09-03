import 'package:cubitflutter/bagundatar/cubitbagundatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagundatarUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Bangun Datar'),
      ),
      body: BlocProvider(
        create: (context) => BagundatarCubit(),
        child: BagundatarForm(),
      ),
    );
  }
}

class BagundatarForm extends StatelessWidget {
  final TextEditingController sisiController = TextEditingController();
  final TextEditingController panjangController = TextEditingController();
  final TextEditingController lebarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: sisiController,
            decoration: InputDecoration(
              labelText: 'Sisi Persegi',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
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
              final sisi = double.tryParse(sisiController.text) ?? 0;
              final panjang = double.tryParse(panjangController.text) ?? 0;
              final lebar = double.tryParse(lebarController.text) ?? 0;
              context.read<BagundatarCubit>().hitungPersegi(sisi);
              context
                  .read<BagundatarCubit>()
                  .hitungPersegiPanjang(panjang, lebar);
            },
            child: Text('Hitung'),
          ),
          SizedBox(height: 16),
          BlocBuilder<BagundatarCubit, BagundatarState>(
            builder: (context, state) {
              if (state is BagundatarCalculated) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Luas Persegi: ${state.luasPersegi}'),
                    Text('Keliling Persegi: ${state.kelilingPersegi}'),
                    Text('Luas Persegi Panjang: ${state.luasPersegiPanjang}'),
                    Text(
                        'Keliling Persegi Panjang: ${state.kelilingPersegiPanjang}'),
                  ],
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
