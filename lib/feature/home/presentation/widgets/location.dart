import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wiqa/feature/home/presentation/widgets/date_time.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Location> {
  String currentAddress = 'جارٍ تحديد الموقع...';

  @override
  void initState() {
    super.initState();
    _getCurrentAddress();
  }

  Future<void> _getCurrentAddress() async {
    bool serviceEnabled;
    LocationPermission permission;

    // التحقق من تفعيل الخدمة
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        currentAddress = 'خدمة الموقع غير مفعّلة.';
      });
      return;
    }

    // التحقق من الصلاحية
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          currentAddress = 'تم رفض صلاحية الموقع.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        currentAddress =
            'تم رفض الصلاحية دائمًا. يرجى تفعيلها من إعدادات الجهاز.';
      });
      return;
    }

    // الحصول على الإحداثيات
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    try {
      // تحويل الإحداثيات إلى عنوان
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
        currentAddress =
            '${place.locality}, ${place.administrativeArea}, ${place.country}';
      });
    } catch (e) {
      setState(() {
        currentAddress = 'حدث خطأ أثناء جلب العنوان';
      });
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 46,
        width: 375,
        color: Color(0xffF5F5F5),
        child: Row(
          children: [
            SizedBox(
              height: 46,
              width: 154,
              child: Column(
                children: [
                  Text("المكان "),
                  Text(
                    currentAddress,
                    style: TextStyle(fontSize: 14),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 46,
              width: 154,
              child: Column(children: [Text("التاريخ  "), Time()]),
            ),
          ],
        ),
      ),
    );
  }
}
