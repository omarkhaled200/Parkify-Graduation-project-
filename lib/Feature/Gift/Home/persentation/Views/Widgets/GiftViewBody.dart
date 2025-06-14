import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/CustomContainerGiftPoint.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/CustomPointGiftSliverGrid.dart';
import 'package:parkify/constant.dart';

class GiftViewBody extends StatefulWidget {
  const GiftViewBody({super.key, required this.user});
  final UserModel user;
  @override
  State<GiftViewBody> createState() => _GiftViewBodyState();
}

class _GiftViewBodyState extends State<GiftViewBody> {
  ScrollController controller = ScrollController();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  BlocBuilder<UserBalancePointCubit, UserBalancePointState>(
                      builder: (context, state) {
                    if (state is UserBalancePointSuccess) {
                      return CustomContainerGiftPoint(
                        heaight: height,
                        width: width,
                        Points: state.value.points!,
                      );
                    } else if (state is UserBalancePointFailure) {
                      CustomScaffoldMessenger(
                          context,
                          "Error is : ${state.errmessage}",
                          FontAwesomeIcons.circleXmark,
                          Colors.red);
                      return const Text('Failed to load Points');
                    } else {
                      return const Center(
                        child: SpinKitFadingCircle(color: Colors.black),
                      );
                    }
                  }),
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: height * 0.02,
              ),
            ),
            CustomPointGiftSliverGrid(
              controller: controller,
              user: widget.user,
            ),
          ],
        ),
      ),
    );
  }
}
