import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Payment/Home/data/Repo/Home_Repo_impl.dart';
import 'package:parkify/Feature/Payment/Home/persentation/View_Model/Get_Transaction_History/get_transaction_history_cubit.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/BottomSheetView.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/CustomTransactionHistory.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Widgets/FlipCardWidget.dart';
import 'package:parkify/constant.dart';

class PaymentViewbody extends StatefulWidget {
  const PaymentViewbody({super.key, required this.user});
  final UserModel user;

  @override
  State<PaymentViewbody> createState() => _PaymentViewbodyState();
}

class _PaymentViewbodyState extends State<PaymentViewbody> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Future<void> _handelRefresh() async {
      context
          .read<GetTransactionHistoryCubit>()
          .getTransactionHistory(token: widget.user.token!);
      context
          .read<UserBalancePointCubit>()
          .getbalanceandpoints(token: widget.user.token!);
      return await Future.delayed(const Duration(seconds: 2));
    }

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
        child: RefreshIndicator(
          backgroundColor: Colors.transparent,
          color: kprimaryColor,
          onRefresh: _handelRefresh,
          displacement: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: FlipCardWidget(
                  heaight: heaight,
                  controller: controller,
                  userModel: widget.user,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomButton(
                  width: width,
                  heaight: heaight,
                  text: 'Add Balance',
                  onPressed: () {
                    // final updated = await
                    showModalBottomSheet(
                        backgroundColor: const Color(0xff434343),
                        context: context,
                        builder: (BuildContext context) {
                          return BottomSheetView(
                            token: widget.user.token!,
                          );
                        });

                    // if (updated == true) {
                    //   context
                    //       .read<GetTransactionHistoryCubit>()
                    //       .getTransactionHistory(token: widget.user.token!);
                    //   context
                    //       .read<UserBalancePointCubit>()
                    //       .getbalanceandpoints(token: widget.user.token!);
                    // }
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
              BlocBuilder<GetTransactionHistoryCubit,
                  GetTransactionHistoryState>(
                builder: (context, state) {
                  if (state is GetTransactionHistorySuccess) {
                    return SliverList.builder(
                      itemCount: state.history.length,
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
                                heaight: heaight,
                                width: width,
                                history: state.history[index],
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (state is GetTransactionHistoryFailure) {
                    return SliverToBoxAdapter(
                      child: Text('Error: ${state.errmessage}'),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: SpinKitFadingCircle(color: Colors.black),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
