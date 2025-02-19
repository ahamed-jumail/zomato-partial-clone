import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseEvent {}

abstract class BaseState {}

class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<Event, State> {
  BaseBloc(super.initialState);
}
