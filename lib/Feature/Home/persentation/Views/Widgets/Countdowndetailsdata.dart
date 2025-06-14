import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/data/Model/active_reservtion_model/active_reservtion_model.dart';

class Countdowndetailsdata extends StatelessWidget {
  const Countdowndetailsdata({super.key, required this.reservtionModel});
  final ActiveReservtionModel reservtionModel;

  @override
  Widget build(BuildContext context) {
    String isoDate = reservtionModel.expectedArrival.toString();

    // Parse the ISO string
    DateTime dateTime = DateTime.parse(isoDate);

    // تنسيق التاريخ بالشكل اللي انت عايزه
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());

    print(formattedDate);

    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300, width: 1)),
      child: Padding(
        padding:
            const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spot name: ${reservtionModel.reservableSpot!.spotCode} ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: Assets.textfamily,
              ),
            ),
            Text(
              'license plate: ${reservtionModel.licensePlate}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: Assets.textfamily,
              ),
            ),
            Text(
              'arrival time: $formattedDate',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                fontFamily: Assets.textfamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
