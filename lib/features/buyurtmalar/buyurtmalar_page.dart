import 'package:flutter/material.dart';

class BuyurtmalarPage extends StatefulWidget {
  const BuyurtmalarPage({super.key});

  @override
  State<BuyurtmalarPage> createState() => _BuyurtmalarPageState();
}

class _BuyurtmalarPageState extends State<BuyurtmalarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Buyurtmalar page",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
