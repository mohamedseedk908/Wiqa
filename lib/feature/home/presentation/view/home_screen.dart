import 'package:flutter/material.dart';
import 'package:wiqa/feature/home/presentation/widgets/location.dart';
import 'package:wiqa/feature/home/presentation/widgets/prayer_card.dart';
import 'package:wiqa/feature/home/presentation/widgets/worship.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(child: Location()),
          SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(child: PrayerCard()),
          SliverToBoxAdapter(child: SizedBox(height: 18)),
          SliverToBoxAdapter(child: Worship()),
          SliverToBoxAdapter(child: AzkarGrid()),
        ],
      ),
    );
  }
}

class AzkarGrid extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.nights_stay, 'label': 'أذكار المساء'},
    {'icon': Icons.wb_sunny, 'label': 'أذكار الصباح'},
    {'icon': Icons.access_time, 'label': 'أذكار الصلاة'},
    {'icon': Icons.pan_tool_alt, 'label': 'جميع الأدعية'},
    {'icon': Icons.format_list_bulleted, 'label': 'التسبيح'},
    {'icon': Icons.calendar_today, 'label': 'التقويم الهجري'},
    {'icon': Icons.favorite, 'label': 'المفضلة'},
    {'icon': Icons.location_on, 'label': 'اقرب المساجد لك'},
    {'icon': Icons.book, 'label': 'أذكار متنوعة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true, // مهم جداً
          physics: NeverScrollableScrollPhysics(), // يمنع التمرير داخل GridView
          children: items.map((item) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], size: 36, color: Colors.blue),
                  SizedBox(height: 8),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}




