import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/gen/assets.gen.dart';
import 'package:gestion_presence_cabrel/src/blocs/employee/employee_cubit.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/shared/widgets/custom_loader.dart';

@RoutePage()
class EmployeeLoginScreen extends StatefulWidget {
  const EmployeeLoginScreen({super.key});

  @override
  State<EmployeeLoginScreen> createState() => _EmployeeLoginScreenState();
}

class _EmployeeLoginScreenState extends State<EmployeeLoginScreen> {
  final _matriculeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final _employeeCubit = EmployeeCubit(context.read<EmployeeRepository>());

  @override
  void dispose() {
    _matriculeController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _employeeCubit,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.svgs.employeeIdSvgrepoCom.svg(
                    width: 200,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text("Entre ton matricule"),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _matriculeController,
                    validator: _matriculeValidator,
                  ),
                  const SizedBox(height: 32),
                  BlocConsumer<EmployeeCubit, EmployeeState>(
                    builder: (context, state) {
                      if (state is EmployeeLoading) {
                        return const CustomLoader();
                      }
                      return FilledButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _employeeCubit.loginEmployee(
                                _matriculeController.text.trim());
                          }
                        },
                        child: const Text("Connexion"),
                      );
                    },
                    listener: (BuildContext context, EmployeeState state) {
                      if (state is EmployeeLoaded) {
                        context.router.push(EmployeeUpdatePresenceRoute(
                          employee: state.employee,
                        ));
                      }

                      if (state is EmployeeError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _matriculeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Veuillez renseigner votre matricule";
    }
    return null;
  }
}
