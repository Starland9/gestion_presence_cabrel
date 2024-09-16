import 'package:equatable/equatable.dart';
import 'package:gestion_presence_cabrel/src/extensions/datetime_extensions.dart';

class Presence extends Equatable {
  const Presence({
    required this.matricule,
    required this.dates,
  });

  final String matricule;
  final List<DateTime> dates;

  @override
  List<Object?> get props => [matricule, dates];

  DateTime get lastDate => dates.isNotEmpty ? dates.last : DateTime(2000);

  bool get isToday => dates.isNotEmpty ? dates.last.isToday() : false;

  void addDate(DateTime date) {
    dates.add(date);
  }
}
