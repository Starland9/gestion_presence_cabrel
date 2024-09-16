import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';
import 'package:gestion_presence_cabrel/src/blocs/employee/employee_cubit.dart';
import 'package:gestion_presence_cabrel/src/blocs/presence/presences_cubit.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';
import 'package:gestion_presence_cabrel/src/mocks/mock_data_provider.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';
import 'package:gestion_presence_cabrel/src/screens/home/components/home_card.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FadeInLeftBig(
                child: HomeCard(
                  imageSvgPath: Assets.svgs.employeeIdSvgrepoCom.path,
                  title: 'Employés',
                  color: theme.colorScheme.primary,
                  onTap: () => context.router.push(const EmployeeLoginRoute()),
                ),
              ),
            ),
            Expanded(
              child: FadeInRightBig(
                child: HomeCard(
                  imageSvgPath: Assets.svgs.adminWithCogwheelsSvgrepoCom.path,
                  title: 'Administration',
                  color: theme.colorScheme.secondary,
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final mockDataProvider = MockDataProvider();
    return RepositoryProvider(
      create: (context) => mockDataProvider,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PresencesCubit(PresenceRepository(mockDataProvider))
                  ..getPresences(),
          ),
          BlocProvider(
            create: (context) =>
                EmployeeCubit(EmployeeRepository(mockDataProvider))
                  ..getEmployees(),
          ),
        ],
        child: this,
      ),
    );
  }
}
