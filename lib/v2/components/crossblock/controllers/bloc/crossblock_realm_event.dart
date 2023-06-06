part of 'crossblock_realm_bloc.dart';

abstract class CrossblockRealmEvent extends Equatable {
  const CrossblockRealmEvent();

  @override
  List<Object> get props => [];
}

class CrossblockRealmGenerateIdEvent extends CrossblockRealmEvent {
  const CrossblockRealmGenerateIdEvent();
}

class CrossblockRealmGetDataEvent extends CrossblockRealmEvent {
  const CrossblockRealmGetDataEvent();
}

class CrossblockAddCrossblockRealmEvent extends CrossblockRealmEvent {
  final crossblockRealmModel data;
  const CrossblockAddCrossblockRealmEvent(this.data);

  @override
  List<Object> get props => [data];
}

class CrossblockRealmDeleteEvent extends CrossblockRealmEvent {
  final crossblockRealmModel data;
  const CrossblockRealmDeleteEvent(this.data);

  @override
  List<Object> get props => [data];
}
