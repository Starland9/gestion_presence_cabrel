import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gestion_presence_cabrel/src/blocs/common/common_cubit.dart';
import 'package:gestion_presence_cabrel/src/core/router/app_router.gr.dart';
import 'package:gestion_presence_cabrel/src/models/employee.dart';
import 'package:gestion_presence_cabrel/src/models/presence.dart';
import 'package:gestion_presence_cabrel/src/repositories/common_repository.dart';
import 'package:gestion_presence_cabrel/src/repositories/employee_repository.dart';
import 'package:gestion_presence_cabrel/src/repositories/presence_repository.dart';
import 'package:gestion_presence_cabrel/src/shared/widgets/custom_loader.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

@RoutePage()
class PdfGenerationScreen extends StatelessWidget {
  const PdfGenerationScreen({super.key, required this.employees});

  final List<Employee> employees;

  @override
  Widget build(BuildContext context) {
    final List<String> matricules = employees.map((m) => m.matricule).toList();

    return BlocProvider(
      create: (context) => CommonCubit(
        CommonRepository(
          employeeRepository: context.read<EmployeeRepository>(),
          presenceRepository: context.read<PresenceRepository>(),
        ),
      )..getPresencesMap(matricules),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<CommonCubit, CommonState>(
          builder: (context, state) {
            if (state is CommonPresencesMapLoaded) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Générer le PDF des présences"),
                      const SizedBox(height: 32),
                      FilledButton(
                        onPressed: () =>
                            _generatePDF(state.presencesMap, context),
                        child: const Text("Génerer le PDF"),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is CommonFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return const Center(child: CustomLoader());
          },
        ),
      ),
    );
  }

  Future<void> _generatePDF(
      Map<Employee, Presence> presencesMap, BuildContext context) async {
    final pdf = pw.Document();

    final entries = presencesMap.entries.toList();

    final List<List<MapEntry<Employee, Presence>>> partsOf25 = [];
    const int chunkSize = 30;
    for (int i = 0; i < entries.length; i += chunkSize) {
      if (i + chunkSize > entries.length) {
        partsOf25.add(entries.sublist(i));
      } else {
        partsOf25.add(entries.sublist(i, i + chunkSize));
      }
    }

    const pageFormat = PdfPageFormat(450, 750, marginAll: 20);

    pdf.addPage(
      pw.Page(
        pageFormat: pageFormat,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                "Liste de présences\nDate : ${DateFormat("dd/MM/yyyy").format(DateTime.now())}",
                style: pw.TextStyle(
                  fontSize: 25,
                  fontWeight: pw.FontWeight.bold,
                  decoration: pw.TextDecoration.underline,
                ),
              ),
              pw.SizedBox(height: 20),
              _buildTable(partsOf25.first),
            ],
          );
        },
        theme: pw.ThemeData(
          defaultTextStyle: const pw.TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ); // Page

    for (var operations in partsOf25) {
      if (operations == partsOf25.first) {
        continue;
      }
      pdf.addPage(
        pw.Page(
          pageFormat: pageFormat,
          build: (pw.Context context) {
            return pw.Column(
              children: [
                _buildTable(operations),
              ],
            );
          },
          theme: pw.ThemeData(
            defaultTextStyle: const pw.TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    final bytes = await pdf.save();

    if (context.mounted) {
      await context.router.push(PdfVisualisationRoute(docData: bytes));
    }
  }

  pw.Widget _buildTable(
    List<MapEntry<Employee, Presence>> entries,
  ) {
    final dateFormat = DateFormat("HH:mm");

    return pw.Table(
      children: [
        _buildHeadTable(),
        for (var entry in entries)
          pw.TableRow(
            children: [
              pw.SizedBox(
                child: pw.Text(
                  " ${entry.key.matricule} ",
                  maxLines: 1,
                ),
              ),
              pw.SizedBox(
                child: pw.Text(
                  " ${entry.key.name} ",
                  maxLines: 1,
                ),
              ),
              pw.Container(
                color: entry.value.dates.isNotEmpty
                    ? PdfColors.green.shade(0.01)
                    : PdfColors.red.shade(0.01),
                child: pw.Text(
                  entry.value.dates.isNotEmpty
                      ? " ${dateFormat.format(entry.value.dates.first)} "
                      : " --:-- ",
                  maxLines: 1,
                ),
              ),
              pw.Container(
                color: entry.value.dates.length > 1
                    ? PdfColors.green.shade(0.01)
                    : PdfColors.red.shade(0.01),
                child: pw.Text(
                  entry.value.dates.length > 1
                      ? " ${dateFormat.format(entry.value.dates.last)} "
                      : " --:-- ",
                ),
              ),
            ],
          ),
      ],
      border: pw.TableBorder.all(color: PdfColors.grey, width: 1),
    );
  }

  pw.TableRow _buildHeadTable() {
    final labels = [
      " Matricule ",
      " Nom ",
      " Arrivé ",
      " Départ ",
    ];

    return pw.TableRow(
      children: [
        for (var label in labels)
          pw.SizedBox(
            child: pw.Text(
              label,
              maxLines: 1,
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
