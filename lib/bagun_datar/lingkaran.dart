import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lingkaran_cubit.dart';

class LingkaranPage extends StatelessWidget {
  const LingkaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LingkaranCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perhitungan Lingkaran'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Masukkan Jari-jari:', style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 7'),
                onChanged: (value) {
                  final radius = double.tryParse(value) ?? 0;
                  context.read<LingkaranCubit>().calculate(radius);
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<LingkaranCubit, LingkaranState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Luas Lingkaran: ${state.area}', style: const TextStyle(fontSize: 18)),
                      Text('Keliling Lingkaran: ${state.circumference}', style: const TextStyle(fontSize: 18)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
