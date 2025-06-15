import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Core/utlis/api_class.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/Feature/Profile/Home/data/Repos/Home_Repo_impl.dart';
import 'package:parkify/Feature/Profile/Home/data/plate_model/plate_model.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Delete_User_Plate/delet_user_plate_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_User_Plates/get_user_plates_cubit.dart';
import 'package:parkify/constant.dart';

class CustomplateCardItem extends StatelessWidget {
  const CustomplateCardItem({
    super.key,
    required this.plate,
    required this.token,
  });
  final PlateModel plate;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kprimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${plate.plate}',
              style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            BlocProvider(
              create: (context) =>
                  DeletUserPlateCubit(profileHomeRepoImpl(ApiClass(Dio()))),
              child: BlocListener<DeletUserPlateCubit, DeletUserPlateState>(
                listener: (context, state) {
                  if (state is DeletUserPlateFailure) {
                    CustomScaffoldMessenger(
                        context,
                        "Error is : ${state.errmessage}",
                        FontAwesomeIcons.circleXmark,
                        Colors.red);
                  } else if (state is DeletUserPlateSuccess) {
                    CustomScaffoldMessenger(context, 'Success',
                        Icons.check_circle_outline, Colors.green);
                    context
                        .read<GetUserPlatesCubit>()
                        .getuserplate(token: token);
                  }
                },
                child: BlocBuilder<DeletUserPlateCubit, DeletUserPlateState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<DeletUserPlateCubit>()
                            .deleteuserplate(id: '${plate.id}', token: token);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        color: Color.fromARGB(255, 194, 10, 10),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
