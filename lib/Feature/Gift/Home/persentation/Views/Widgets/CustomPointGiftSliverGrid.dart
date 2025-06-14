import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/Get%20user%20point%20and%20balance/User_Balance_Point_Cubit/user_balance_point_cubit.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/Activate_Gift/activate_gift_cubit.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/DeActivate_Gift/de_activate_gift_cubit.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/Get_All_Gifts/get_all_gifts_cubit.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Widgets/ItemPointGift.dart';

class CustomPointGiftSliverGrid extends StatefulWidget {
  const CustomPointGiftSliverGrid({
    super.key,
    required this.controller,
    required this.user,
  });
  final ScrollController controller;
  final UserModel user;
  @override
  State<CustomPointGiftSliverGrid> createState() =>
      _CustomPointGiftSliverGridState();
}

class _CustomPointGiftSliverGridState extends State<CustomPointGiftSliverGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllGiftsCubit(HomeRepoImpl(ApiClass(Dio())))
        ..getAllGift(token: widget.user.token!),
      child: BlocBuilder<GetAllGiftsCubit, GetAllGiftsState>(
        builder: (context, state) {
          if (state is GetAllGiftsSuccess) {
            return SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: state.gift.length,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: widget.controller,
                    builder: (context, child) {
                      double offset = 0;
                      if (widget.controller.hasClients) {
                        offset = widget.controller.offset / 75 - index;
                      }
                      offset = offset.clamp(0, 2);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => ActivateGiftCubit(
                                    HomeRepoImpl(ApiClass(Dio()))),
                              ),
                              BlocProvider(
                                create: (context) => DeActivateGiftCubit(
                                    HomeRepoImpl(ApiClass(Dio()))),
                              ),
                            ],
                            child: MultiBlocListener(
                              listeners: [
                                BlocListener<ActivateGiftCubit,
                                    ActivateGiftState>(
                                  listener: (context, state) {
                                    if (state is ActivateGiftSuccess) {
                                      CustomScaffoldMessenger(
                                          context,
                                          state.message,
                                          Icons.check_circle_outline,
                                          Colors.green);
                                      context
                                          .read<UserBalancePointCubit>()
                                          .getbalanceandpoints(
                                              token: widget.user.token!);
                                    } else if (state is ActivateGiftFailure) {
                                      CustomScaffoldMessenger(
                                          context,
                                          state.errmessage,
                                          FontAwesomeIcons.circleXmark,
                                          Colors.red);
                                    }
                                  },
                                ),
                                BlocListener<DeActivateGiftCubit,
                                    DeActivateGiftState>(
                                  listener: (context, state) {
                                    if (state is DeActivateGifSuccess) {
                                      CustomScaffoldMessenger(
                                          context,
                                          state.message,
                                          Icons.check_circle_outline,
                                          Colors.green);
                                      context
                                          .read<UserBalancePointCubit>()
                                          .getbalanceandpoints(
                                              token: widget.user.token!);
                                    } else if (state is DeActivateGifFailure) {
                                      CustomScaffoldMessenger(
                                          context,
                                          state.errmessage,
                                          FontAwesomeIcons.circleXmark,
                                          Colors.red);
                                    }
                                  },
                                ),
                              ],
                              child: ItemPointGift(
                                gift: state.gift[index],
                                user: widget.user,
                              ),
                            )),
                      );
                    },
                  );
                });
          } else if (state is GetAllGiftsFailure) {
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
    );
  }
}
