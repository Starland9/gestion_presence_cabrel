import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/src/mocks/mock_data_provider.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';

class EmployeeRepository {
  late final MockDataProvider _mockDataProvider;

  EmployeeRepository(
    MockDataProvider mockDataProvider,
  ) {
    _mockDataProvider = mockDataProvider;
  }

  List<Employee> getEmployees() {
    return _mockDataProvider.employees
      ..sort((a, b) => a.name.compareTo(b.name));
  }

  Employee? getEmployeeByMatricule(String matricule) {
    try {
      return _mockDataProvider.employees
          .firstWhere((employee) => employee.matricule == matricule);
    }  catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
