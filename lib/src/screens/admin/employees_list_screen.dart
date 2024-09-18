import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/src/blocs/employee/employee_cubit.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/screens/admin/components/employee_list_item.dart';
import 'package:gestion_presence_cabrel/src/shared/widgets/custom_loader.dart';

@RoutePage()
class EmployeesListScreen extends StatefulWidget {
  const EmployeesListScreen({super.key});

  @override
  State<EmployeesListScreen> createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  String _query = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EmployeeCubit(context.read<EmployeeRepository>())..getEmployees(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Liste des employés"),
          bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 40),
            child: CupertinoSearchTextField(
              placeholder: "Rechercher...",
              onChanged: _updateQuery,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            if (state is EmployeeListLoaded) {
              final employees = state.employees
                  .where((e) =>
                      e.matricule
                          .toLowerCase()
                          .contains(_query.toLowerCase()) ||
                      e.name.toLowerCase().contains(_query.toLowerCase()))
                  .toList();

              if (employees.isEmpty) {
                return const Center(
                  child: Text("Aucun employé"),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (final emp in employees) EmployeeListItem(emp: emp),
                  ],
                ),
              );
            }
            return const Center(child: CustomLoader());
          },
        ),
      ),
    );
  }

  void _updateQuery(String value) {
    setState(() {
      _query = value;
    });
  }
}
