part of 'crossblock_realm_bloc.dart';

abstract class CrossblockRealmState extends Equatable {
  final RequestState requestState;
  const CrossblockRealmState({
    this.requestState = RequestState.initial,
  });

  @override
  List<Object> get props => [requestState];
}

class CrossblockRealmInitialState extends CrossblockRealmState {
  const CrossblockRealmInitialState({required super.requestState});
}

class CrossBlockRealmAddState extends CrossblockRealmState {
  final String generateId;
  final String errorAdd;
  const CrossBlockRealmAddState({
    super.requestState = RequestState.initial,
    this.generateId = "",
    this.errorAdd = "",
  });

  @override
  List<Object> get props => [
        requestState,
        generateId,
        errorAdd,
      ];
}

class CrossBlockRealmDeleteState extends CrossblockRealmState {
  final String errorDelete;
  const CrossBlockRealmDeleteState({
    super.requestState = RequestState.initial,
    this.errorDelete = "",
  });

  @override
  List<Object> get props => [
        requestState,
        errorDelete,
      ];
}

class CrossBlockRealmGetState extends CrossblockRealmState {
  final String errorGet;
  final List<crossblockRealmModel> datas;
  const CrossBlockRealmGetState({
    super.requestState = RequestState.initial,
    this.errorGet = "",
    this.datas = const [],
  });

  @override
  List<Object> get props => [
        requestState,
        errorGet,
      ];
}
