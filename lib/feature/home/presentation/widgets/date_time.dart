import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    initializeDate(); // نهيئ التاريخ
  }

  void initializeDate() async {
    await initializeDateFormatting('ar', null); // تهيئة اللغة العربية
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMMEEEEd('ar').format(now);
    setState(() {
      formattedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        formattedDate.isEmpty ? 'جاري تحميل التاريخ...' : formattedDate,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
