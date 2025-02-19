import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/bloc/app_bloc/recepie_item_bloc/recepie_item_bloc.dart';
import 'package:zomato_partial_clone/views/widgets/recepie_item_widget.dart';

class BuildForRecepieItemWidget extends StatelessWidget {
  const BuildForRecepieItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecepieItemBloc, RecepieItemState>(
      builder: (context, state) {
        if (state is RecepieItemLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is RecepieItemLoaded) {
          final recepies = state.recepies;
          return Container(
            height: 235,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: recepies.isEmpty
                ? Center(child: Text('No recepies found'))
                : ListView.builder(
                    padding: EdgeInsets.only(right: 15),
                    itemCount: recepies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final recepie = recepies[index];
                      final recepie2 = recepies[9 - index];
                      return Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            RecepieItemWidget(
                                recepieName: recepie.recepieName,
                                recepieImage: recepie.recepieImageUrl),
                            SizedBox(height: 15),
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
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
