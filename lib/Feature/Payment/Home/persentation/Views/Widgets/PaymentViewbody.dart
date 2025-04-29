import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BottomSheetView.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/CustomTransactionHistory.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FlipCardWidget.dart';
import 'package:parkify/constant.dart';

class PaymentViewbody extends StatefulWidget {
  const PaymentViewbody({super.key, required this.token});
  final String token;

  @override
  State<PaymentViewbody> createState() => _PaymentViewbodyState();
}

class _PaymentViewbodyState extends State<PaymentViewbody> {
  ScrollController scrollController = ScrollController();
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
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: FlipCardWidget(heaight: heaight, controller: controller),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                width: width,
                heaight: heaight,
                text: 'Add Balance',
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: const Color(0xff434343),
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetView(
                          token: widget.token,
                        );
                      });
                },
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
                return AnimatedBuilder(
                    animation: scrollController,
                    builder: (context, child) {
                      double offset = 0;
                      if (scrollController.hasClients) {
                        offset = scrollController.offset / 150 - index;
                      }
                      offset = offset.clamp(0, 2);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: CustomTransactionHistory(
                            heaight: heaight, width: width),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
