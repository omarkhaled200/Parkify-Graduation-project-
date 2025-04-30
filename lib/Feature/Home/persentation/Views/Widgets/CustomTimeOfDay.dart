import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';

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
        TimeOfDay? newtime =
            await showTimePicker(context: context, initialTime: time);
        if (newtime == null) return;
        setState(() {
          time = newtime;
        });
        // نرجع الوقت للصفحة الأب
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
