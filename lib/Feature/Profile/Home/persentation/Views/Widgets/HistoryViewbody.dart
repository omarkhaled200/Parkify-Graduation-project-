import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomTabBar.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListViewPublic.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListViewReserved.dart';
import 'package:parkify/constant.dart';

class HistoryViewbody extends StatefulWidget {
  const HistoryViewbody({super.key, required this.token});
  final String token;
  @override
  State<HistoryViewbody> createState() => _HistoryViewbodyState();
}

class _HistoryViewbodyState extends State<HistoryViewbody> {
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kprimaryColor,
          title: IconApp(width: width),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(heaight * 0.06),
            child: const CustomTabBar(),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  Expanded(
                    child: HistoryListView(
                      token: widget.token,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Expanded(
                child: Historylistviewpublic(
                  token: widget.token,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
