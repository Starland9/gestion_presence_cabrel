// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:gestion_presence_cabrel/src/screens/employee/employee_login_screen.dart'
    as _i1;
import 'package:gestion_presence_cabrel/src/screens/employee/employee_update_presence_screen.dart'
    as _i2;
import 'package:gestion_presence_cabrel/src/screens/home/home_screen.dart'
    as _i3;
import 'package:gestion_presence_cabrel/src/screens/onboarding/onboarding_screen.dart'
    as _i4;

/// generated route for
/// [_i1.EmployeeLoginScreen]
class EmployeeLoginRoute extends _i5.PageRouteInfo<void> {
  const EmployeeLoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EmployeeLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeeLoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.EmployeeLoginScreen();
    },
  );
}

/// generated route for
/// [_i2.EmployeeUpdatePresenceScreen]
class EmployeeUpdatePresenceRoute extends _i5.PageRouteInfo<void> {
  const EmployeeUpdatePresenceRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EmployeeUpdatePresenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeeUpdatePresenceRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.EmployeeUpdatePresenceScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute({List<_i5.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingScreen();
    },
  );
}
