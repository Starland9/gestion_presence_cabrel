import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  late final EmployeeRepository _employeeRepository;

  EmployeeCubit(EmployeeRepository employeeRepository)
      : _employeeRepository = employeeRepository,
        super(EmployeeInitial());

  void getEmployees() {
    emit(EmployeeListLoading());
    try {
      final employees = _employeeRepository.getEmployees();
      emit(EmployeeListLoaded(employees));
    } on Exception catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }

  void loginEmployee(String matricule) {
    emit(EmployeeLoading());
    try {
      final employee = _employeeRepository.getEmployeeByMatricule(matricule);
      if (employee == null) {
        emit(const EmployeeError("Matricule invalide"));
      } else {
        emit(EmployeeLoaded(employee));
      }
    } on Exception catch (e) {
      emit(EmployeeError(e.toString()));
    }
  }
}
