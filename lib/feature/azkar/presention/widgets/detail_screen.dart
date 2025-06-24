import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String title;

  const DetailScreen({super.key, required this.id, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> azkar = [];

  @override
  void initState() {
    super.initState();
    loadAzkar();
  }

  Future<void> loadAzkar() async {
    try {
      final jsonString = await rootBundle.loadString('assets/azkar.json');
      final data = json.decode(jsonString);
      setState(() {
        azkar = List<String>.from(data[widget.id] ?? []);
      });
    } catch (e) {
      setState(() {
        azkar = ['حدث خطأ أثناء تحميل الأذكار.'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: azkar.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: azkar.length,
          itemBuilder: (context, index) => Card(
            margin: const EdgeInsets.all(12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                azkar[index],
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),
      ),
    );
  }
}