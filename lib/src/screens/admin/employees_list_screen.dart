import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/src/blocs/employee/employee_cubit.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/screens/admin/components/employee_list_item.dart';

@RoutePage()
class EmployeesListScreen extends StatefulWidget {
  const EmployeesListScreen({super.key});

  @override
  State<EmployeesListScreen> createState() => _EmployeesListScreenState();
}

class _EmployeesListScreenState extends State<EmployeesListScreen> {
  String _query = "";

  late final EmployeeCubit _employeeCubit;

  @override
  void initState() {
    _employeeCubit = EmployeeCubit(context.read<EmployeeRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _employeeCubit..getEmployees(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Liste des employés"),
          actions: [
            IconButton(
                onPressed: () => _generatePDF(_employeeCubit),
                icon: const Icon(Icons.print))
          ],
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
            final employees = state is EmployeeListLoaded
                ? state.employees
                    .where((e) =>
                        e.matricule
                            .toLowerCase()
                            .contains(_query.toLowerCase()) ||
                        e.name.toLowerCase().contains(_query.toLowerCase()))
                    .toList()
                : List<Employee>.empty();

            return employees.isEmpty
                ? const Center(
                    child: Text("Aucun employé"),
                  )
                : ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final emp = employees[index];
                      return EmployeeListItem(
                        key: ValueKey<String>(emp.matricule),
                        emp: emp,
                      );
                    },
                  );
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

  void _generatePDF(EmployeeCubit employeeCubit) async {
    await context.router
        .push(PdfGenerationRoute(employees: employeeCubit.employees));
  }
}
