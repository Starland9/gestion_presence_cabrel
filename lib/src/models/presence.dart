import 'package:equatable/equatable.dart';

class Presence extends Equatable {
  const Presence({
    required this.matricule,
    required this.dates,
  });

  final String matricule;
  final List<DateTime> dates;

  @override
  List<Object?> get props => [matricule, dates];

  bool get isAbsent => dates.isEmpty;

  bool get isPresent => !isAbsent;

  DateTime get firstDate => dates.first;

  DateTime get lastDate => dates.last;
}
