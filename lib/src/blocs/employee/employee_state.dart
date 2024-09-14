part of 'employee_cubit.dart';

sealed class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object> get props => [];
}

final class EmployeeInitial extends EmployeeState {}

final class EmployeeListLoading extends EmployeeState {}

final class EmployeeListLoaded extends EmployeeState {
  final List<Employee> employees;
  const EmployeeListLoaded(this.employees);
}

final class EmployeeLoading extends EmployeeState {}

final class EmployeeLoaded extends EmployeeState {
  final Employee employee;
  const EmployeeLoaded(this.employee);
}

final class EmployeeError extends EmployeeState {
  final String message;
  const EmployeeError(this.message);
}
