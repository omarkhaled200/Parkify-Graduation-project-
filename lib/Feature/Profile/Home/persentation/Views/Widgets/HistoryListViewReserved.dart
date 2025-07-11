import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parkify/Core/utlis/Functions/CustomScaffoldMessenger.dart';
import 'package:parkify/Feature/Profile/Home/persentation/View_Model/Get_Reserved_Spot_History/get_reserved_spot_history_cubit.dart';
import 'package:parkify/Feature/Profile/Home/persentation/Views/Widgets/HistoryListViewItem.dart';

class HistoryListView extends StatefulWidget {
  HistoryListView({
    super.key,
    required this.token,
  });
  final String token;
  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReservedSpotHistoryCubit,
        GetReservedSpotHistoryState>(
      builder: (context, state) {
        if (state is GetReservedSpotHistorySuccess) {
          return ListView.builder(
            controller: controller,
            itemCount: state.history.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  double offset = 0;
                  if (controller.hasClients) {
                    offset = controller.offset / 100 - index;
                  }
                  offset = offset.clamp(0, 1);
                  return Transform.scale(
                    scale: 1 - (offset * 0.2),
                    child: HistoryListViewItem(item: state.history[index]),
                  );
                },
              );
            },
          );
        } else if (state is GetReservedSpotHistoryFailure) {
          // CustomScaffoldMessenger(
          //     context, state.errmessage, Icons.error, Colors.red);
          print('the error messege is : ${state.errmessage}');
          return const SizedBox.shrink();
        } else {
          return const SpinKitFadingCircle(
            color: Colors.black,
          );
        }
      },
    );
  }
}
