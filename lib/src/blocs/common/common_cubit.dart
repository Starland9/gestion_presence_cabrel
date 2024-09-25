import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/common_repository.dart';

part 'common_state.dart';

class CommonCubit extends Cubit<CommonState> {
  late final CommonRepository _commonRepository;

  CommonCubit(CommonRepository commonRepository)
      : _commonRepository = commonRepository,
        super(CommonInitial());

  void getPresencesMap(List<String> matricules) {
    try {
      emit(CommonLoading());
      final presencesMap = _commonRepository.getLastPresencesMap(matricules);
      emit(CommonPresencesMapLoaded(presencesMap: presencesMap));
    } catch (e) {
      emit(CommonFailure(message: e.toString()));
    }
  }
}
