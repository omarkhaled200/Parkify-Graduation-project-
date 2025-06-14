import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class CustomTimeOfDay extends StatefulWidget {
  final void Function(TimeOfDay) onTimeChanged;

  const CustomTimeOfDay({super.key, required this.onTimeChanged});

  @override
  State<CustomTimeOfDay> createState() => _CustomTimeOfDayState();
}

class _CustomTimeOfDayState extends State<CustomTimeOfDay> {
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? newtime = await showTimePicker(
          context: context,
          initialTime: time,
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: Theme.of(context).copyWith(
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: Colors.white, // لون الخلفية
                  hourMinuteTextColor: Colors.black, // لون النص للساعة والدقيقة
                  hourMinuteColor:
                      Colors.grey[200], // لون خلفية الساعة والدقيقة
                  dialHandColor: Colors.blue.shade300, // لون عقارب الساعة
                  dialBackgroundColor: Colors.grey[100], // لون خلفية القرص
                  dialTextColor: Colors.black, // لون أرقام القرص
                  entryModeIconColor: Colors.blue, // لون أيقونة تغيير النمط
                  dayPeriodTextColor: Colors.black, // لون نص AM/PM
                  dayPeriodColor: Colors.grey[200], // لون خلفية AM/PM
                  dayPeriodBorderSide:
                      const BorderSide(color: Colors.grey), // حدود AM/PM
                  hourMinuteTextStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // إضافة تخصيص أزرار Cancel و OK
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue.shade300, // لون النص للأزرار
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              child: child!,
            );
          },
        );
        if (newtime == null) return;
        setState(() {
          time = newtime;
        });

        widget.onTimeChanged(time);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time.format(context),
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: Assets.textfamily,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Icon(Icons.timer_outlined, color: Colors.black, size: 24),
          ],
        ),
      ),
    );
  }
}
