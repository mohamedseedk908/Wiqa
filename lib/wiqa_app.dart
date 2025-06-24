import 'package:flutter/material.dart';
import 'package:wiqa/feature/home/presentation/view/home_screen.dart';

class Wiqa extends StatelessWidget {
  const Wiqa({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffA1A1A1)),
      ),
      color:  Color(0xffA1A1A1),
    );
  }
}
