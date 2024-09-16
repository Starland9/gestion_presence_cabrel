import 'package:auto_route/auto_route.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
          // initial: true,
        ),
        AutoRoute(page: EmployeeLoginRoute.page),
        AutoRoute(page: EmployeeUpdatePresenceRoute.page),
        AutoRoute(page: EmployeesListRoute.page),
      ];
}
