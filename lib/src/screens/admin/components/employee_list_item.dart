import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/src/blocs/presence/presences_cubit.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';

class EmployeeListItem extends StatelessWidget {
  const EmployeeListItem({
    super.key,
    required this.emp,
  });

  final Employee emp;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PresencesCubit(context.read<PresenceRepository>())
        ..getLastPresence(emp.matricule),
      child: BlocBuilder<PresencesCubit, PresencesState>(
        builder: (context, state) {
          final presence = state is PresenceLoaded
              ? state.presence
              : context.read<PresencesCubit>().presence;

          return ListTile(
            onTap: presence.dates.isEmpty
                ? null
                : () => _showPresenceDetails(context, presence),
            title: Text(emp.name),
            subtitle: Text(emp.matricule),
            trailing: CupertinoSwitch(
              value: presence.isToday,
              onChanged: (_) {},
            ),
          );
        },
      ),
    );
  }

  void _showPresenceDetails(BuildContext context, Presence presence) async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text("Details"),
        content: Text(
          "Arrivé à ${presence.dates.first.hour}:${presence.dates.first.minute} ",
        ),
      ),
    );
  }
}
