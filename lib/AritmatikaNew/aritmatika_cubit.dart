import 'package:bloc/bloc.dart';
import 'package:cubitflutter/AritmatikaNew/aritmatika_event.dart';
import 'package:meta/meta.dart';

part 'aritmatika_state.dart';

class AritmatikaCubit extends Bloc<AritmatikaState, AritmatikaEvent> {
  AritmatikaCubit():super(AritmatikaState())
};