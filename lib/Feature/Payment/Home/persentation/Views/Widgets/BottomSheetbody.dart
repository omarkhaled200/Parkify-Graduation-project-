import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/CustomButton.dart';
import 'package:parkify/Core/utlis/CustomTextField.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/Functions/custom_lunch_url.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Payment/Home/data/Model/payment_model.dart';
import 'package:parkify/Feature/Payment/Home/persentation/View_Model/Post_Payment_Cubit/post_payment_cubit.dart';

class BottomSheetbody extends StatefulWidget {
  const BottomSheetbody({super.key, required this.token});
  final String token;
  @override
  State<BottomSheetbody> createState() => _BottomSheetbodyState();
}

class _BottomSheetbodyState extends State<BottomSheetbody> {
  String? amount;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<PostPaymentCubit, PostPaymentState>(
      listener: (context, state) {
        if (state is PostPaymentFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is PostPaymentSuccess) {
          customLaunchUrl(context, state.payment.paymentUrl);
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tap here to top up your account balance and enjoy uninterrupted access ❤️!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heaight * 0.02,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor: Colors.white.withOpacity(0.5),
                  hintText: 'Enter Amount',
                  prefixIcon: Icons.attach_money_outlined,
                  onchanged: (data) {
                    amount = data;
                  },
                  typekeyboard: TextInputType.number,
                  valdiate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Amount';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Amount  must contain only numbers';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: heaight * 0.1,
                ),
                CustomButton(
                  width: width,
                  heaight: heaight,
                  text: 'Transfer',
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      context.read<PostPaymentCubit>().Postpayment(
                          method: 'card', amount: amount!, token: widget.token);
                    }
                  },
                  backcolor: const Color(0xff1D5CD1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
