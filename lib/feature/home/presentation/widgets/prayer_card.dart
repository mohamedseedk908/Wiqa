import 'package:flutter/material.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: 375,
        height: 165,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB2EBF2), Color(0xFF81D4FA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          textDirection: TextDirection.rtl, // نخلي الصورة يمين
          children: [
            // الصورة على اليمين
            SizedBox(
              height: 165,
              width: 224,
              child: Image.asset(
                'assets/image/logo1.png', // 🕌 ضع صورة المآذن هنا
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
            const SizedBox(width: 12),
            // النصوص
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: const [
                Text(
                  'الظهر',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 6),
                Text(
                  '11:45 م',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'الصلاة التالية: العصر',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 4),
                Text(
                  '2:50 مساءً',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}