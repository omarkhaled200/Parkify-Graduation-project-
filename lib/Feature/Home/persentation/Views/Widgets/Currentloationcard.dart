import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Functions/custom_lunch_url.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/data/Model/LocationModel/LocatiomModel.dart';

class Currentloationcard extends StatelessWidget {
  const Currentloationcard({super.key, required this.loc});
  final LocationModel loc;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300, width: 1)),
      child: Padding(
        padding:
            const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xffDBEAFE),
                      borderRadius: BorderRadius.circular(24)),
                  child: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                    size: 32,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Location',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontFamily: Assets.textfamily,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${loc.name}',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: Assets.textfamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                customLaunchUrl(context, loc.gpsLocation);
              },
              child: Row(
                children: [
                  const Icon(FontAwesomeIcons.arrowUpRightFromSquare),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text(
                    'View',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: Assets.textfamily,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
