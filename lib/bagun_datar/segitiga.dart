import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'segitiga_cubit.dart';

class SegitigaPage extends StatelessWidget {
  const SegitigaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SegitigaCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perhitungan Segitiga'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Masukkan Alas:', style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 5'),
                onChanged: (value) {
                  final base = double.tryParse(value) ?? 0;
                  final height = double.tryParse(context.read<TextEditingController>().text) ?? 0;
                  context.read<SegitigaCubit>().calculate(base, height);
                },
              ),
              const SizedBox(height: 20),
              const Text('Masukkan Tinggi:', style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 10'),
                onChanged: (value) {
                  final height = double.tryParse(value) ?? 0;
                  final base = double.tryParse(context.read<TextEditingController>().text) ?? 0;
                  context.read<SegitigaCubit>().calculate(base, height);
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<SegitigaCubit, SegitigaState>(
                builder: (context, state) {
                  return Text('Luas Segitiga: ${state.area}', style: const TextStyle(fontSize: 18));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
