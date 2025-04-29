import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/data/Model/history_data_modal/history_data_modal.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomAmountRickText.dart';
import 'package:parkify/constant.dart';

class HistoryListViewItem extends StatelessWidget {
  const HistoryListViewItem({
    super.key,
    required this.item,
  });

  final HistoryDataModal item;

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
                  'Spot ${item.id}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  'License Plate:${item.licensePlate}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
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
                CustomAmountRickText(item: item.invoicePrice!),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Arrival: ${item.enteredAt}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xffA0A0A0),
                          fontFamily: Assets.textfamily,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "Exit: ${item.exitedAt}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xffA0A0A0),
                          fontFamily: Assets.textfamily,
                          fontSize: 10,
                        ),
                      ),
                    ],
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
