import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';

class CommonRepository {
  late final EmployeeRepository _employeeRepository;
  late final PresenceRepository _presenceRepository;

  CommonRepository({
    required EmployeeRepository employeeRepository,
    required PresenceRepository presenceRepository,
  }) {
    _employeeRepository = employeeRepository;
    _presenceRepository = presenceRepository;
  }

  Map<Employee, Presence> getLastPresencesMap(List<String> matricules) {
    Map<Employee, Presence> presencesMap = {};

    for (var matricule in matricules) {
      final employee = _employeeRepository.getEmployeeByMatricule(matricule);
      final lastPresences = _presenceRepository.getLastPresence(matricule);

      if (employee != null) presencesMap[employee] = lastPresences;
    }

    return presencesMap;
  }
}
