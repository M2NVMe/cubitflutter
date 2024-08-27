import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'trapesium_cubit.dart';

class TrapesiumPage extends StatelessWidget {
  const TrapesiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TrapesiumCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Perhitungan Trapesium'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Masukkan Panjang Sisi Atas:',
                  style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 8'),
                onChanged: (value) {
                  final baseA = double.tryParse(value) ?? 0;
                  final baseB = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  final height = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  context
                      .read<TrapesiumCubit>()
                      .calculate(baseA, baseB, height);
                },
              ),
              const SizedBox(height: 20),
              const Text('Masukkan Panjang Sisi Bawah:',
                  style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 10'),
                onChanged: (value) {
                  final baseB = double.tryParse(value) ?? 0;
                  final baseA = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  final height = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  context
                      .read<TrapesiumCubit>()
                      .calculate(baseA, baseB, height);
                },
              ),
              const SizedBox(height: 20),
              const Text('Masukkan Tinggi:', style: TextStyle(fontSize: 18)),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Contoh: 6'),
                onChanged: (value) {
                  final height = double.tryParse(value) ?? 0;
                  final baseA = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  final baseB = double.tryParse(
                          context.read<TextEditingController>().text) ??
                      0;
                  context
                      .read<TrapesiumCubit>()
                      .calculate(baseA, baseB, height);
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<TrapesiumCubit, TrapesiumState>(
                builder: (context, state) {
                  return Text('Luas Trapesium: ${state.area}',
                      style: const TextStyle(fontSize: 18));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
