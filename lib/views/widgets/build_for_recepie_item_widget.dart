import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recepie_item_bloc/recepie_item_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/recepie_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildForRecepieItemWidget extends StatefulWidget {
  const BuildForRecepieItemWidget({super.key});

  @override
  State<BuildForRecepieItemWidget> createState() =>
      BuildForRecepieItemWidgetState();
}

class BuildForRecepieItemWidgetState extends State<BuildForRecepieItemWidget> {
  late final RecepieItemBloc recepieItemBloc;

  @override
  void initState() {
    recepieItemBloc = BlocProvider.of<RecepieItemBloc>(context);
    final state = BlocProvider.of<RecepieItemBloc>(context).state;
    if (state is! RecepieItemLoaded) {
      recepieItemBloc.add(FetchRecepieItems());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecepieItemBloc, RecepieItemState>(
      builder: (context, state) {
        if (state is RecepieItemLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecepieItemLoaded) {
          final recepies = state.recepies;
          return Container(
            height: 242.h,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: recepies.isEmpty
                ? Center(child: Text('No recepies found'))
                : ListView.builder(
                    padding: EdgeInsets.only(right: 15.w),
                    itemCount: recepies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final recepie = recepies[index];
                      final recepie2 = recepies[9 - index];
                      return Padding(
                        padding: EdgeInsets.only(left: 15.w),
                        child: Column(
                          children: [
                            RecepieItemWidget(
                                recepieName: recepie.recepieName,
                                recepieImage: recepie.recepieImageUrl),
                            SizedBox(height: 15.h),
                            RecepieItemWidget(
                                recepieName: recepie2.recepieName,
                                recepieImage: recepie2.recepieImageUrl)
                          ],
                        ),
                      );
                    },
                  ),
          );
        } else if (state is RecepieItemError) {
          return Center(child: Text("Error in fetching."));
        }
        return Container();
      },
    );
  }
}
