import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/data/gift_model/gift_model.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/Activate_Gift/activate_gift_cubit.dart';
import 'package:parkify/Feature/Gift/Home/persentation/View_Model/DeActivate_Gift/de_activate_gift_cubit.dart';
import 'package:parkify/constant.dart';

class ItemPointGift extends StatefulWidget {
  const ItemPointGift({
    super.key,
    required this.user,
    required this.gift,
  });
  final UserModel user;
  final GiftModel gift;
  @override
  State<ItemPointGift> createState() => _ItemPointGiftState();
}

class _ItemPointGiftState extends State<ItemPointGift> {
  static int? _currentlyActivatedGiftId; // <-- ده بقى المتغير المشترك
  bool get isSelected => _currentlyActivatedGiftId == widget.gift.id;

  void _showdialog() {
    final scaffoldContext = context;
    final activateGiftCubit = context.read<ActivateGiftCubit>();
    final deActivateGiftCubit = context.read<DeActivateGiftCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            '✔️ Confirmation',
            style: TextStyle(
                fontFamily: Assets.textfamily,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          ),
          content: Text(
            isSelected
                ? 'Are you sure you want to de-activate this gift?'
                : (_currentlyActivatedGiftId == null
                    ? 'Do you want to activate this gift?'
                    : 'Another gift is already activated. Please deactivate it first.'),
            style: TextStyle(
              fontFamily: Assets.textfamily,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kprimaryColor),
              onPressed: () {
                if (isSelected) {
                  // Deactivate current
                  deActivateGiftCubit.deactivateGift(
                    token: widget.user.token!,
                    id: '${widget.gift.id}',
                  );
                  setState(() {
                    _currentlyActivatedGiftId = null;
                  });
                } else {
                  if (_currentlyActivatedGiftId == null) {
                    // Activate
                    activateGiftCubit.activateGift(
                      token: widget.user.token!,
                      id: "${widget.gift.id}",
                    );
                    setState(() {
                      _currentlyActivatedGiftId = widget.gift.id;
                    });
                  } else {
                    CustomScaffoldMessenger(
                        scaffoldContext,
                        "Another gift is already activated.\n Please deactivate it first.",
                        FontAwesomeIcons.circleExclamation,
                        Colors.red);
                  }
                }

                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(
                    fontFamily: Assets.textfamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kprimaryColor),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: Assets.textfamily,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Column(
            children: [
              Text(
                '${widget.gift.discountPercentage}% off your next park',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: _showdialog,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isSelected ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
