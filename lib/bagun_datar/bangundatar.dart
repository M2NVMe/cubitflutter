import 'package:flutter/material.dart';
import 'persegi.dart';
import 'segitiga.dart';
import 'lingkaran.dart';
import 'trapesium.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perhitungan Bangun Datar'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Persegi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersegiPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Segitiga'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SegitigaPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Lingkaran'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LingkaranPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Trapesium'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TrapesiumPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
