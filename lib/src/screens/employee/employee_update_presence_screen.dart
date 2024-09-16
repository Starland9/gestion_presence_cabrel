import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';
import 'package:gestion_presence_cabrel/src/blocs/presence/presences_cubit.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';
import 'package:gestion_presence_cabrel/src/screens/employee/components/current_hour_viewer.dart';
import 'package:gestion_presence_cabrel/src/screens/employee/components/presence_action_button.dart';
import 'package:gestion_presence_cabrel/src/shared/widgets/custom_loader.dart';

@RoutePage()
class EmployeeUpdatePresenceScreen extends StatelessWidget {
  const EmployeeUpdatePresenceScreen({super.key, required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => PresencesCubit(context.read<PresenceRepository>())
        ..getLastPresence(employee.matricule),
      child: Scaffold(
        body: Center(
          child: BlocConsumer<PresencesCubit, PresencesState>(
            listener: (context, state) {
              if (state is PresencesError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (context, state) {
              final presence = state is PresenceLoaded
                  ? state.presence
                  : context.watch<PresencesCubit>().presence;

              if (state is PresencesLoading) {
                return const CustomLoader();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.images.eneoCameroonLogo.image(),
                  Text(
                    employee.name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CurrentHourViewer(),
                  if (!presence.isToday || presence.dates.isEmpty)
                    SlideInUp(
                      child: PresenceActionButton(
                        text: "Arrivé",
                        color: Colors.green,
                        rotated: false,
                        onTap: () => context
                            .read<PresencesCubit>()
                            .addPresence(employee.matricule),
                      ),
                    ),
                  _buildStatusTexts(presence, theme),
                  if (presence.isToday && presence.dates.length < 2)
                    SlideInDown(
                      child: PresenceActionButton(
                        text: "Départ",
                        color: Colors.red,
                        rotated: true,
                        onTap: () => context
                            .read<PresencesCubit>()
                            .addPresence(employee.matricule),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatusTexts(Presence presence, ThemeData theme) {
    if (!presence.isToday) return const SizedBox();
    return Column(
      children: [
        if (presence.dates.isNotEmpty)
          Text(
            "Vous êtes arrivé à ${presence.dates.first.hour}:${presence.dates.first.minute.toString().padLeft(2, '0')}",
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.green,
            ),
          ),
        const SizedBox(height: 16),
        if (presence.dates.length > 1)
          Text(
            "Vous êtes rentré à ${presence.dates.last.hour}:${presence.dates.last.minute.toString().padLeft(2, '0')}",
            style: theme.textTheme.titleLarge?.copyWith(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
