import 'package:faker/faker.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';

class MockDataProvider {
  factory MockDataProvider() => _instance;

  static final MockDataProvider _instance = MockDataProvider._internal();

  MockDataProvider._internal();

  int count = 50;

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

  late final List<Presence> presences = [];
}
