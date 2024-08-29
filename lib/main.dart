import 'package:cubitflutter/Utama.dart';
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