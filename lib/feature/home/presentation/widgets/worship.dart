import 'package:flutter/material.dart';

class Worship extends StatelessWidget {
  const Worship({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SizedBox(
        width: 295,
        height: 43,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border:Border.all(),
          ),
          child: Center(
            child: Text(
              "جميع العبادات",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}