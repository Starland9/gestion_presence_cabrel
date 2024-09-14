import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/src/core/constants/colors.dart';
import 'package:gestion_presence_cabrel/src/core/constants/strings.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

class GPCApp extends StatelessWidget {
  GPCApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      ),
    );
  }
}
