part of 'presences_cubit.dart';

sealed class PresencesState extends Equatable {
  const PresencesState();

  @override
  List<Object> get props => [];
}

final class PresencesInitial extends PresencesState {}

final class PresencesListLoading extends PresencesState {}

final class PresencesListLoaded extends PresencesState {
  final List<Presence> presences;
  const PresencesListLoaded(this.presences);

  @override
  List<Object> get props => [presences];
}

final class PresencesLoading extends PresencesState {}

final class PresenceLoaded extends PresencesState {
  final Presence presence;
  const PresenceLoaded(this.presence);

  @override
  List<Object> get props => [presence];
}

final class PresencesError extends PresencesState {
  final String message;
  const PresencesError(this.message);

  @override
  List<Object> get props => [message];
}
