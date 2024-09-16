import 'package:gestion_presence_cabrel/src/extensions/datetime_extensions.dart';
import 'package:gestion_presence_cabrel/src/mocks/mock_data_provider.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';

class PresenceRepository {
  late final MockDataProvider _mockDataProvider;

  PresenceRepository(
    MockDataProvider mockDataProvider,
  ) {
    _mockDataProvider = mockDataProvider;
  }

  List<Presence> getPresences() {
    return _mockDataProvider.presences
      ..sort((a, b) => a.lastDate.compareTo(b.lastDate));
  }

  List<Presence> getPresencesByMatricule(String matricule) {
    return getPresences()
        .where((presence) => presence.matricule == matricule)
        .toList();
  }

  List<Presence> getPresencesByDate(DateTime date) {
    return getPresences()
        .where((presence) => presence.dates.contains(date))
        .toList();
  }

  Presence getLastPresence(String matricule) {
    return getPresencesByMatricule(matricule).last;
  }

  Presence addPresence(String matricule) {
    Presence lastPresence = getPresences().lastWhere(
      (p) {
        return p.matricule == matricule && p.dates.last.isToday();
      },
      orElse: () {
        return Presence(
          matricule: matricule,
          dates: List.empty(growable: true),
        );
      },
    );

    if (lastPresence.dates.isEmpty) {
      lastPresence.dates.add(DateTime.now());
      _mockDataProvider.presences.add(lastPresence);
    } else if (lastPresence.dates.length == 1) {
      lastPresence.dates.add(DateTime.now());
      _mockDataProvider.presences.add(lastPresence);
    }

    return lastPresence;
  }
}
