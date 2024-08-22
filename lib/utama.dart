import 'package:flutter/material.dart';

class utama extends StatefulWidget {
  const utama({super.key});

  @override
  State<utama> createState() => _utamaState();
}

class _utamaState extends State<utama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit State Management app"),
      ),
    );
  }
}
