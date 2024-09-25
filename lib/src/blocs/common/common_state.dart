part of 'common_cubit.dart';

sealed class CommonState extends Equatable {
  const CommonState();

  @override
  List<Object> get props => [];
}

final class CommonInitial extends CommonState {}

final class CommonPresencesMapLoaded extends CommonState {
  final Map<Employee, Presence> presencesMap;

  const CommonPresencesMapLoaded({required this.presencesMap});

  @override
  List<Object> get props => [presencesMap];
}

final class CommonLoading extends CommonState {}

final class CommonFailure extends CommonState {
  final String message;

  const CommonFailure({required this.message});

  @override
  List<Object> get props => [message];
}
