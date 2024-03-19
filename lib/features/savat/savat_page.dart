import 'package:flutter/material.dart';

class SavatPage extends StatefulWidget {
  const SavatPage({super.key});

  @override
  State<SavatPage> createState() => _SavatPageState();
}

class _SavatPageState extends State<SavatPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Savatlar page",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
