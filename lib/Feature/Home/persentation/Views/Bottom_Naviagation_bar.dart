import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Gift_view.dart';
import 'package:parkify/Feature/Home/data/Model/location_model/location_model.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/BottomNavCubit.dart';
import 'package:parkify/Feature/Home/persentation/View_Model/Manage_Page/manage_page_cubit.dart';
import 'package:parkify/Feature/Home/persentation/Views/HomePage1.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page_CountUp.dart';
import 'package:parkify/Feature/Home/persentation/Views/Home_page_Countdown.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Payment_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Profile_view.dart';
import 'package:parkify/constant.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    late LocationModel location;
    late UserModel user;

    final extra = GoRouterState.of(context).extra;
    if (extra is UserModel) {
      user = extra;
      location = LocationModel(
        id: 0,
        name: 'Unknown',
        address: 'Unknown address',
        gpsLocation: '0.0,0.0',
        isActive: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
    } else if (extra is Map<String, dynamic>) {
      user = extra['userdata'] as UserModel;
      final rawLocation = extra['location'];
      if (rawLocation != null && rawLocation is LocationModel) {
        location = rawLocation;
      } else {
        location = LocationModel(
          id: 0,
          name: 'Unknown',
          address: 'Unknown address',
          gpsLocation: '0.0,0.0',
          isActive: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      }
    }

    print('user data is ${user.user!.email}');
    print('user data is ${user.user!.name}');
    print('user data is ${user.userData!.phone}');
    final otherPages = [
      GiftView(
        userdata: user,
      ),
      PaymentView(user: user),
      ProfileView(token: user.token!),
    ];

    // --------- ✅ 3. Main widget ---------
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: [
              _HomeManageStateView(
                user: user,
                loc: location,
              ), // Home tab dynamic
              ...otherPages,
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 300),
            color: kprimaryColor,
            backgroundColor: Colors.white,
            items: const [
              Icon(Icons.home_rounded),
              Icon(Icons.wallet_giftcard_rounded),
              Icon(Icons.payments_rounded),
              Icon(Icons.person_2_rounded),
            ],
            index: currentIndex,
            onTap: (index) {
              FocusScope.of(context).unfocus();
              context.read<BottomNavCubit>().setPage(index);
            },
          ),
        );
      },
    );
  }
}

class _HomeManageStateView extends StatefulWidget {
  final UserModel user;
  final LocationModel loc;
  const _HomeManageStateView({required this.user, required this.loc});

  @override
  State<_HomeManageStateView> createState() => _HomeManageStateViewState();
}

class _HomeManageStateViewState extends State<_HomeManageStateView> {
  @override
  void initState() {
    super.initState();
    // تأخير التحميل لمرحلة initState بعد بناء الـ context
    Future.microtask(() {
      context.read<ManagePageCubit>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ManagePageCubit>();

    if (!cubit.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return BlocConsumer<ManagePageCubit, ManagePageState>(
      listener: (context, state) {
        print('Current state: $state');
      },
      builder: (context, state) {
        switch (state) {
          case ManagePageState.reserve:
            return Homepage1(userdata: widget.user);
          case ManagePageState.countdown:
            return HomePageCountdown(
              user: widget.user,
            );
          case ManagePageState.countup:
            return HomePageCountup(userdata: widget.user);
          default:
            return Homepage1(userdata: widget.user);
        }
      },
    );
  }
}
