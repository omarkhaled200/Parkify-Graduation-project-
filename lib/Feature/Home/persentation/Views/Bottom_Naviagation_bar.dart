import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/persentation/Views/Gift_view.dart';
import 'package:parkify/Feature/Home/persentation/Views/HomePage1.dart';
import 'package:parkify/Feature/Payment/Home/persentation/Views/Payment_View.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Profile_view.dart';
import 'package:parkify/constant.dart';

class BottomNaviagationBar extends StatefulWidget {
  const BottomNaviagationBar({super.key});

  @override
  State<BottomNaviagationBar> createState() => _Homepage2bodyState();
}

class _Homepage2bodyState extends State<BottomNaviagationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userdate = GoRouterState.of(context).extra as UserModel?;
    final List<Widget> _widgetOptions = <Widget>[
      Homepage1(
        userdata: userdate!,
      ),
      GiftView(),
      PaymentView(
        token: userdate.token!,
      ),
      ProfileView(token: userdate.token!),
    ];
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
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
        index: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
}
