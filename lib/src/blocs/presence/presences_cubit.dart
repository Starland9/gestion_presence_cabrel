import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';

part 'presences_state.dart';

class PresencesCubit extends Cubit<PresencesState> {
  late final PresenceRepository _presenceRepository;

  Presence? _presence;

  PresencesCubit(
    PresenceRepository presenceRepository,
  )   : _presenceRepository = presenceRepository,
        super(PresencesInitial());

  void getPresences() {
    emit(PresencesListLoading());
    try {
      final presences = _presenceRepository.getPresences();
      emit(PresencesListLoaded(presences));
    } on Exception catch (e) {
      emit(PresencesError(e.toString()));
    }
  }

  void getPresencesByMatricule(String matricule) {
    emit(PresencesListLoading());
    try {
      final presences = _presenceRepository.getPresencesByMatricule(matricule);
      emit(PresencesListLoaded(presences));
    } on Exception catch (e) {
      emit(PresencesError(e.toString()));
    }
  }

  void getLastPresence(String matricule) {
    emit(PresencesLoading());
    try {
      final lastPresence = _presenceRepository.getLastPresence(matricule);
      _presence = lastPresence;
      emit(PresenceLoaded(lastPresence));
    } on Exception catch (e) {
      emit(PresencesError(e.toString()));
    }
  }

  void addPresence(String matricule) {
    emit(PresencesLoading());
    try {
      final presence = _presenceRepository.addPresence(matricule);
      _presence = presence;
      emit(PresenceLoaded(presence));
    } on Exception catch (e) {
      emit(PresencesError(e.toString()));
    }
  }

  Presence get presence =>
      _presence ??
      const Presence(
        matricule: "",
        dates: [],
      );
}
