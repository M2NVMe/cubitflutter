import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'persegi_cubit.dart';

class PersegiPage extends StatelessWidget {
  const PersegiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PersegiCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perhitungan Persegi'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Masukkan Panjang Sisi:', style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 5'),
                onChanged: (value) {
                  final side = double.tryParse(value) ?? 0;
                  context.read<PersegiCubit>().calculate(side);
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<PersegiCubit, PersegiState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Luas Persegi: ${state.area}', style: const TextStyle(fontSize: 18)),
                      Text('Keliling Persegi: ${state.perimeter}', style: const TextStyle(fontSize: 18)),
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
