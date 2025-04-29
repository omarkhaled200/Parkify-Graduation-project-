import 'package:flutter/material.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListViewItem.dart';

class HistoryListView extends StatefulWidget {
  HistoryListView({
    super.key,
  });

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  ScrollController controller = ScrollController();
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
      controller: controller,
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            double offset = 0;
            if (controller.hasClients) {
              offset = controller.offset / 100 - index;
            }
            offset = offset.clamp(0, 1);
            return Transform.scale(
              scale: 1 - (offset * 0.2),
              child: HistoryListViewItem(item: item),
            );
          },
        );
      },
    );
  }
}
