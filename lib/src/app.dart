import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/src/core/constants/colors.dart';
import 'package:gestion_presence_cabrel/src/core/constants/strings.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.dart';
import 'package:gestion_presence_cabrel/src/mocks/mock_data_provider.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class GPCApp extends StatelessWidget {
  GPCApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => EmployeeRepository(MockDataProvider()),
        ),
        RepositoryProvider(
          create: (context) => PresenceRepository(MockDataProvider()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
          ),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.onPrimary,
              fixedSize: const Size(double.maxFinite, 58),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
