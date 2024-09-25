// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i11;

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:gestion_presence_cabrel/src/models/employee.dart' as _i10;
import 'package:gestion_presence_cabrel/src/screens/admin/employees_list_screen.dart'
    as _i3;
import 'package:gestion_presence_cabrel/src/screens/employee/employee_login_screen.dart'
    as _i1;
import 'package:gestion_presence_cabrel/src/screens/employee/employee_update_presence_screen.dart'
    as _i2;
import 'package:gestion_presence_cabrel/src/screens/home/home_screen.dart'
    as _i4;
import 'package:gestion_presence_cabrel/src/screens/onboarding/onboarding_screen.dart'
    as _i5;
import 'package:gestion_presence_cabrel/src/screens/pdf/pdf_generation_screen.dart'
    as _i6;
import 'package:gestion_presence_cabrel/src/screens/pdf/pdf_visualisation_screen.dart'
    as _i7;

/// generated route for
/// [_i1.EmployeeLoginScreen]
class EmployeeLoginRoute extends _i8.PageRouteInfo<void> {
  const EmployeeLoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EmployeeLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeeLoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.EmployeeLoginScreen();
    },
  );
}

/// generated route for
/// [_i2.EmployeeUpdatePresenceScreen]
class EmployeeUpdatePresenceRoute
    extends _i8.PageRouteInfo<EmployeeUpdatePresenceRouteArgs> {
  EmployeeUpdatePresenceRoute({
    _i9.Key? key,
    required _i10.Employee employee,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          EmployeeUpdatePresenceRoute.name,
          args: EmployeeUpdatePresenceRouteArgs(
            key: key,
            employee: employee,
          ),
          initialChildren: children,
        );

  static const String name = 'EmployeeUpdatePresenceRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EmployeeUpdatePresenceRouteArgs>();
      return _i2.EmployeeUpdatePresenceScreen(
        key: args.key,
        employee: args.employee,
      );
    },
  );
}

class EmployeeUpdatePresenceRouteArgs {
  const EmployeeUpdatePresenceRouteArgs({
    this.key,
    required this.employee,
  });

  final _i9.Key? key;

  final _i10.Employee employee;

  @override
  String toString() {
    return 'EmployeeUpdatePresenceRouteArgs{key: $key, employee: $employee}';
  }
}

/// generated route for
/// [_i3.EmployeesListScreen]
class EmployeesListRoute extends _i8.PageRouteInfo<void> {
  const EmployeesListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          EmployeesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesListRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.EmployeesListScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.WrappedRoute(child: const _i4.HomeScreen());
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i6.PdfGenerationScreen]
class PdfGenerationRoute extends _i8.PageRouteInfo<PdfGenerationRouteArgs> {
  PdfGenerationRoute({
    _i9.Key? key,
    required List<_i10.Employee> employees,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PdfGenerationRoute.name,
          args: PdfGenerationRouteArgs(
            key: key,
            employees: employees,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfGenerationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfGenerationRouteArgs>();
      return _i6.PdfGenerationScreen(
        key: args.key,
        employees: args.employees,
      );
    },
  );
}

class PdfGenerationRouteArgs {
  const PdfGenerationRouteArgs({
    this.key,
    required this.employees,
  });

  final _i9.Key? key;

  final List<_i10.Employee> employees;

  @override
  String toString() {
    return 'PdfGenerationRouteArgs{key: $key, employees: $employees}';
  }
}

/// generated route for
/// [_i7.PdfVisualisationScreen]
class PdfVisualisationRoute
    extends _i8.PageRouteInfo<PdfVisualisationRouteArgs> {
  PdfVisualisationRoute({
    _i9.Key? key,
    required _i11.Uint8List docData,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PdfVisualisationRoute.name,
          args: PdfVisualisationRouteArgs(
            key: key,
            docData: docData,
          ),
          initialChildren: children,
        );

  static const String name = 'PdfVisualisationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PdfVisualisationRouteArgs>();
      return _i7.PdfVisualisationScreen(
        key: args.key,
        docData: args.docData,
      );
    },
  );
}

class PdfVisualisationRouteArgs {
  const PdfVisualisationRouteArgs({
    this.key,
    required this.docData,
  });

  final _i9.Key? key;

  final _i11.Uint8List docData;

  @override
  String toString() {
    return 'PdfVisualisationRouteArgs{key: $key, docData: $docData}';
  }
}
