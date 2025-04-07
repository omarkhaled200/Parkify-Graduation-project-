import 'package:flutter/material.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/CustomContainerGiftPoint.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/CustomPointGiftSliverGrid.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/constant.dart';

class GiftView extends StatelessWidget {
  const GiftView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GiftViewBody();
  }
}

class GiftViewBody extends StatelessWidget {
  const GiftViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        centerTitle: true,
        title: Text(
          'Points',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: Assets.textfamily,
          ),
        ),
        leading: IconApp(width: width),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  // لو ده مش بيظهر، جرب حط مكانه Container مؤقتًا للتجربة
                  CustomContainerGiftPoint(heaight: height, width: width),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Note: Upon deactivation you will get 80% of your paid points',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: height * 0.02,
            ),
          ),
          const CustomPointGiftSliverGrid(),
        ],
      ),
    );
  }
}
