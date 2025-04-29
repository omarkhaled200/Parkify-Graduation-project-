import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/App_Router.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/CustomLocationCard.dart';
import 'package:parkify/Feature/Home/persentation/Views/Widgets/DisplayMoneyWidget.dart';
import 'package:parkify/constant.dart';

class Homepage1body extends StatefulWidget {
  const Homepage1body({super.key});

  @override
  State<Homepage1body> createState() => _Homepage1bodyState();
}

class _Homepage1bodyState extends State<Homepage1body> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        actions: [DisplaymoneyWidget(width: width)],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heaight * 0.01,
              ),
              Text(
                "Select the Parking",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: Assets.textfamily,
                ),
              ),
              SizedBox(
                height: heaight * 0.02,
              ),
              Expanded(
                child: ListView.builder(
                    controller: controller,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double offset = 0;
                          if (controller.hasClients) {
                            offset = controller.offset / 65 - index;
                          }
                          offset = offset.clamp(0, 3);
                          return Transform.scale(
                            scale: 1 - (offset * 0.2),
                            child: GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.Homepage2);
                                },
                                child: const CustomLocationCard()),
                          );
                        },
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
