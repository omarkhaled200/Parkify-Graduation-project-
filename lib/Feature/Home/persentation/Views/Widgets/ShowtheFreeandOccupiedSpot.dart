import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/MQTT_Mange_Cubit/mqtt_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomavailabilitySpot.dart';

class ShowtheFreeandOccupiedSpot extends StatelessWidget {
  const ShowtheFreeandOccupiedSpot({
    super.key,
    required this.width,
    required this.heaight,
    required this.numberSpot,
  });

  final double width;
  final double heaight;
  final String numberSpot;
  @override
  Widget build(BuildContext context) {
    List<String> parts = numberSpot.split(' ');

    int freePublic = int.parse(parts[0]);
    int freeReservable = int.parse(parts[1]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomavailabilitySpot(
          width: width,
          heaight: heaight,
          text: 'Free Public',
          color: const Color.fromARGB(255, 116, 231, 120),
          NumberSpot: freePublic,
        ),
        CustomavailabilitySpot(
          width: width,
          heaight: heaight,
          text: 'Free Reservable',
          color: Colors.red,
          NumberSpot: freeReservable,
        ),
      ],
    );
  }
}
