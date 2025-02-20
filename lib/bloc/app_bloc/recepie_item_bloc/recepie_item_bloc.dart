import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zomato_partial_clone/api_services/recepie_item_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/recepie_item.dart';

part 'recepie_item_event.dart';
part 'recepie_item_state.dart';

class RecepieItemBloc extends BaseBloc<RecepieItemEvent, RecepieItemState> {
  RecepieItemBloc() : super(RecepieItemInitial());

  final RecepieItemService recepieItemService = RecepieItemService();

  Future<void> fetchRecepieItems(
      FetchRecepieItems event, Emitter<RecepieItemState> emit) async {
    emit(RecepieItemLoading());

    final recepies = await recepieItemService.fetchRecepieItems();

    emit(RecepieItemLoaded(recepies));
  }

  @override
  Future<void> eventHandlerMethod(
      RecepieItemEvent event, Emitter<RecepieItemState> emit) async {
    switch (event.runtimeType) {
      case const (FetchRecepieItems):
        return fetchRecepieItems(event as FetchRecepieItems, emit);
    }
  }

  @override
  RecepieItemState getErrorState() {
    return RecepieItemError();
  }
}
