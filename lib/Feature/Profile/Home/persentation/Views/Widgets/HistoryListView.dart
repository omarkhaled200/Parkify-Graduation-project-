import 'package:flutter/material.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListViewItem.dart';

class HistoryListView extends StatelessWidget {
  HistoryListView({
    super.key,
  });

  final item = {
    "spot": "Spot 1",
    "code": "Code 1",
    "amount": "\$11.99",
    "arrival": "2023-10-01 10:00 AM",
    "exit": "2023-10-01 12:00 PM",
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return HistoryListViewItem(item: item);
      },
    );
  }
}
