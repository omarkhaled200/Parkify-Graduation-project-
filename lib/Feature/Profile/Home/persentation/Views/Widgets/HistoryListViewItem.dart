import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomAmountRickText.dart';
import 'package:parkify/constant.dart';

class HistoryListViewItem extends StatelessWidget {
  const HistoryListViewItem({
    super.key,
    required this.item,
  });

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      color: kprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item["spot"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  item["code"]!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: heaight * 0.015),
            const Divider(color: Color(0xffD8DBDC)),
            SizedBox(height: heaight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAmountRickText(item: item),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Arrival: ${item["arrival"]}",
                      style: TextStyle(
                        color: const Color(0xffA0A0A0),
                        fontFamily: Assets.textfamily,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "Exit: ${item["exit"]}",
                      style: TextStyle(
                        color: const Color(0xffA0A0A0),
                        fontFamily: Assets.textfamily,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
