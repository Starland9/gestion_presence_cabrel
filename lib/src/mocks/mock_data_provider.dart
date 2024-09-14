import 'dart:math';

import 'package:faker/faker.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';

class MockDataProvider {
  factory MockDataProvider() => _instance;

  static final MockDataProvider _instance = MockDataProvider._internal();

  MockDataProvider._internal();

  int count = 20;

  late final List<Employee> employees = [
    ...List.generate(
      count,
      (_) => Employee(
        name: faker.person.name(),
        matricule: faker.randomGenerator
            .fromCharSet("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", 6),
      ),
    ),
    const Employee(
      matricule: "ABC123",
      name: "Cabrel Kamguia",
    )
  ];

  late final List<Presence> presences = [
    ...List.generate(
      count * 30,
      (_) => Presence(
        matricule: employees[Random().nextInt(employees.length)].matricule,
        dates: [
          faker.date.dateTime(minYear: 2024, maxYear: 2024),
          faker.date.dateTime(minYear: 2024, maxYear: 2024),
        ],
      ),
    ),
  ];
}
