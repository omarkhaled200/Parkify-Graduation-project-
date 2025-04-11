import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BackCardPayment.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/CustomTransactionHistory.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FlipCardWidget.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FrontCardpayment.dart';

import 'package:parkify/constant.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentViewbody();
  }
}

class PaymentViewbody extends StatelessWidget {
  const PaymentViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final controller = FlipCardController();
    controller.flipcard();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: FlipCardWidget(heaight: heaight, controller: controller),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                width: width,
                heaight: heaight,
                text: 'Add Balance',
                onPressed: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: heaight * 0.02,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: Assets.textfamily,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: heaight * 0.02,
              ),
            ),
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomTransactionHistory(heaight: heaight, width: width);
              },
            ),
          ],
        ),
      ),
    );
  }
}
