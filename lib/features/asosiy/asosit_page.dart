import 'package:flutter/material.dart';

class AsosiyPage extends StatefulWidget {
  const AsosiyPage({super.key});

  @override
  State<AsosiyPage> createState() => _AsosiyPageState();
}

class _AsosiyPageState extends State<AsosiyPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Asosiy page",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
