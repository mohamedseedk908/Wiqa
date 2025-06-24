import 'package:flutter/material.dart';
import 'package:wiqa/feature/home/presentation/widgets/azkar_grid.dart';
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







