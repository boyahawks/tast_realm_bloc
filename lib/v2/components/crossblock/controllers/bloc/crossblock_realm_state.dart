// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crossblock_realm_bloc.dart';

class CrossblockRealmState extends Equatable {
  final RequestState addState;
  final RequestState getState;
  final RequestState deleteState;
  final String generateId;
  final String errorAdd;
  final String errorDelete;
  final List<crossblockRealmModel> datas;
  const CrossblockRealmState({
    required this.addState,
    required this.getState,
    required this.deleteState,
    required this.generateId,
    required this.errorAdd,
    required this.errorDelete,
    required this.datas,
  });

  @override
  List<Object> get props => [
        addState,
        getState,
        deleteState,
        datas,
        errorAdd,
        generateId,
        errorDelete,
      ];

  CrossblockRealmState copyWith({
    RequestState? addState,
    RequestState? getState,
    RequestState? deleteState,
    String? generateId,
    String? errorAdd,
    String? errorDelete,
    List<crossblockRealmModel>? datas,
  }) {
    return CrossblockRealmState(
      addState: addState ?? this.addState,
      getState: getState ?? this.getState,
      deleteState: deleteState ?? this.deleteState,
      generateId: generateId ?? this.generateId,
      errorAdd: errorAdd ?? this.errorAdd,
      errorDelete: errorDelete ?? this.errorDelete,
      datas: datas ?? this.datas,
    );
  }
}
