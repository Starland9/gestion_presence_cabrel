import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  final String matricule;
  final String name;

  const Employee({
    required this.matricule,
    required this.name,
  });

  @override
  List<Object?> get props => [matricule, name];
}
