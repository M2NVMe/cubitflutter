import 'package:cubitflutter/Aritmetika/KalkCubit.dart';
import 'package:cubitflutter/Pangkat/perpangkatanCubit.dart';
import 'package:cubitflutter/Utama.dart';
import 'package:cubitflutter/bagundatar/cubitbagundatar.dart';
import 'package:cubitflutter/bangun_ruang/cubit/bangun_ruang_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //TODO: mencoba utk implement blocprovider apalah itu disini, barangkali  perlu gituan (source:  https://createthrive.com/blog/introduction-to-cubit-101-learning-the-basics)
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BangunRuangCubit()),
        BlocProvider(create: (context) => Aritmatikcubit()),
        BlocProvider(create: (context) => PerpangkatanCubit()),
        BlocProvider(create: (context) => BagundatarCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kelompok 8',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const mainPage(),
      ),
    );
  }
}
