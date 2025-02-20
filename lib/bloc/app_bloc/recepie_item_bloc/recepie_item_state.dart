part of 'recepie_item_bloc.dart';

abstract class RecepieItemState extends ErrorState {}

class RecepieItemInitial extends RecepieItemState {}

class RecepieItemLoading extends RecepieItemState {}

class RecepieItemLoaded extends RecepieItemState {
  final List<RecepieItem> recepies;
  RecepieItemLoaded(this.recepies);
}

class RecepieItemError extends RecepieItemState {}
