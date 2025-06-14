import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomAddplatepart.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/CustomplateCardItem.dart';
import 'package:parkify/constant.dart';

class PlatesViewBody extends StatefulWidget {
  const PlatesViewBody({super.key});

  @override
  State<PlatesViewBody> createState() => _PlatesViewBodyState();
}

class _PlatesViewBodyState extends State<PlatesViewBody> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var token = GoRouterState.of(context).extra as String;
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocProvider(
            create: (context) =>
                GetUserPlatesCubit(HomeRepoImpl(ApiClass(Dio())))
                  ..getuserplate(token: token),
            child: BlocBuilder<GetUserPlatesCubit, GetUserPlatesState>(
              builder: (context, state) {
                return CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: CustomAddplatepart(),
                          ),
                          SizedBox(height: heaight * 0.02),
                          Text(
                            'My plates',
                            style: TextStyle(
                              fontFamily: Assets.textfamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: heaight * 0.01),
                        ],
                      ),
                    ),
                    if (state is GetUserPlatesSuccess)
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return AnimatedBuilder(
                              animation: scrollController,
                              builder: (context, child) {
                                double offset = 0;
                                if (scrollController.hasClients) {
                                  offset =
                                      scrollController.offset / 200 - index;
                                }
                                offset = offset.clamp(0, 2);
                                return Transform.scale(
                                  scale: 1 - (offset * 0.2),
                                  child: CustomplateCardItem(
                                    plate: state.plate[index],
                                    token: token,
                                  ),
                                );
                              },
                            );
                          },
                          childCount: state.plate.length,
                        ),
                      )
                    else if (state is GetUserPlatesFailure) ...[
                      SliverToBoxAdapter(
                        child: Text('Error: ${state.errmessage}'),
                      ),
                    ] else ...[
                      const SliverToBoxAdapter(
                        child: Center(
                          child: SpinKitFadingCircle(color: Colors.black),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          )),
    );
  }
}
