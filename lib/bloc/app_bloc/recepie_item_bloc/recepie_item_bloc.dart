import 'package:zomato_partial_clone/api_services/recepie_item_service.dart';
import 'package:zomato_partial_clone/core/base_bloc/base_bloc.dart';
import 'package:zomato_partial_clone/models/recepie_item.dart';

part 'recepie_item_event.dart';
part 'recepie_item_state.dart';

class RecepieItemBloc extends BaseBloc<RecepieItemEvent, RecepieItemState> {
  final RecepieItemService recepieItemService = RecepieItemService();

  RecepieItemBloc() : super(RecepieItemInitial()) {
    on<FetchRecepieItems>((event, emit) async {
      emit(RecepieItemLoading());

      try {
        final recepies = await recepieItemService.fetchRecepieItems();
        emit(RecepieItemLoaded(recepies));
      } catch (e) {
        emit(RecepieItemError('Error fetching data: $e'));
      }
    });
  }
}
