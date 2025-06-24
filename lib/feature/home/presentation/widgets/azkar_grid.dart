import 'package:flutter/material.dart';
import 'package:wiqa/feature/azkar/presention/widgets/detail_screen.dart';

class AzkarGrid extends StatelessWidget {
  AzkarGrid({super.key});

  final List<Map<String, dynamic>> items = [
    {'id': 'evening', 'icon': Icons.nights_stay, 'label': 'أذكار المساء'},
    {'id': 'morning', 'icon': Icons.wb_sunny, 'label': 'أذكار الصباح'},
    {'id': 'prayer', 'icon': Icons.access_time, 'label': 'أذكار الصلاة'},
    {'id': 'duaa', 'icon': Icons.pan_tool_alt, 'label': 'جميع الأدعية'},
    {'id': 'tasbeeh', 'icon': Icons.format_list_bulleted, 'label': 'التسبيح'},
    {'id': 'calendar', 'icon': Icons.calendar_today, 'label': 'التقويم الهجري'},
    {'id': 'favorite', 'icon': Icons.favorite, 'label': 'المفضلة'},
    {'id': 'mosques', 'icon': Icons.location_on, 'label': 'اقرب المساجد لك'},
    {'id': 'other', 'icon': Icons.book, 'label': 'أذكار متنوعة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          shrinkWrap: true, // ✅ مهم علشان جوه SliverToBoxAdapter
          physics:
              NeverScrollableScrollPhysics(), // ✅ لازم علشان ميحصلش conflict في scroll
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children:
              items.map((item) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => DetailScreen(
                              id: item['id'],
                              title: item['label'],
                            ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: 40, color: Colors.teal),
                        const SizedBox(height: 10),
                        Text(
                          item['label'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
