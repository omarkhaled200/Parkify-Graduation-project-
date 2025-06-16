import 'package:flutter/material.dart';

import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Auth/data/Models/user_model/user_model.dart';
import 'package:parkify/Feature/Gift/Home/data/gift_model/gift_model.dart';

import 'package:parkify/constant.dart';

class ItemPointGift extends StatefulWidget {
  const ItemPointGift({
    super.key,
    required this.user,
    required this.gift,
    required this.isActivated,
    required this.hasAnotherActivated,
    required this.onGiftToggle,
  });
  final UserModel user;
  final GiftModel gift;
  final bool isActivated;
  final bool hasAnotherActivated;
  final Function(int giftId, bool shouldActivate) onGiftToggle;
  @override
  State<ItemPointGift> createState() => _ItemPointGiftState();
}

class _ItemPointGiftState extends State<ItemPointGift> {
  void _showdialog() {
    final scaffoldContext = context;

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
            widget.isActivated
                ? 'Are you sure you want to de-activate this gift?'
                : (widget.hasAnotherActivated
                    ? 'Another gift is already activated. Please deactivate it first.'
                    : 'Do you want to activate this gift?'),
            style: TextStyle(
              fontFamily: Assets.textfamily,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            if (!widget.hasAnotherActivated || widget.isActivated)
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kprimaryColor),
                onPressed: () {
                  // استدعاء الـ callback function
                  widget.onGiftToggle(widget.gift.id!, !widget.isActivated);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.gift.discountPercentage}% off your next park',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Text(
                'Cost: ${widget.gift.cost}pts',
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
                        color: widget.isActivated ? Colors.green : Colors.red,
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
