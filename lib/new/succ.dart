import 'package:flutter/material.dart';

class Succ extends StatelessWidget {
  const Succ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUCC"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.blueGrey),
      ),
    );
  }
}
