import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListView.dart';
import 'package:parkify/constant.dart';

class HistoryViewbody extends StatelessWidget {
  const HistoryViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: heaight * 0.02),
            const Text("History",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: heaight * 0.01),
            Expanded(
              child: HistoryListView(),
            ),
          ],
        ),
      ),
    );
  }
}
