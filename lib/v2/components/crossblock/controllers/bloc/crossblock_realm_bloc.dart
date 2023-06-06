import 'package:dartz/dartz.dart';
import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';
import 'package:ehp/v2/components/crossblock/services/crossblock_realm_services.dart';
import 'package:ehp/v2/helper/utils/state_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'crossblock_realm_event.dart';
part 'crossblock_realm_state.dart';

class CrossblockRealmBloc
    extends Bloc<CrossblockRealmEvent, CrossblockRealmState> {
  CrossblockRealmBloc()
      : super(const CrossblockRealmState(
          addState: RequestState.initial,
          getState: RequestState.initial,
          deleteState: RequestState.initial,
          datas: [],
          generateId: "",
          errorAdd: "",
          errorDelete: "",
        )) {
    on<CrossblockRealmEvent>((event, emit) async {
      if (event is CrossblockRealmGenerateIdEvent) {
        String generateId =
            "BRE1${DateFormat('yyyyMMddHHmmss').format(DateTime.now()).toString()}";
        emit(state.copyWith(generateId: generateId));
      }

      if (event is CrossblockAddCrossblockRealmEvent) {
        emit(state.copyWith(addState: RequestState.loading));
        Either<String, String> res =
            await CrossblockRealmServices.save(event.data);

        res.fold(
            (failure) => emit(state.copyWith(
                addState: RequestState.error, errorAdd: failure)),
            (success) => emit(state.copyWith(addState: RequestState.success)));
      }

      if (event is CrossblockRealmGetDataEvent) {
        try {
          emit(state.copyWith(getState: RequestState.loading));
          List<crossblockRealmModel> res =
              await CrossblockRealmServices.getData();
          emit(state.copyWith(datas: res, getState: RequestState.success));
        } catch (e) {
          emit(state.copyWith(getState: RequestState.error));
        }
      }

      if (event is CrossblockRealmDeleteEvent) {
        emit(state.copyWith(deleteState: RequestState.loading));

        final Either<String, String> res =
            await CrossblockRealmServices.delete(event.data);

        res.fold(
            (failure) => emit(state.copyWith(
                deleteState: RequestState.error, errorDelete: failure)),
            (success) =>
                emit(state.copyWith(deleteState: RequestState.success)));
      }
    });
  }
}
