import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

@RoutePage()
class PdfVisualisationScreen extends StatelessWidget {
  const PdfVisualisationScreen({super.key, required this.docData});

  final Uint8List docData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Présentation")),
      body: PdfPreview(
        build: (format) => docData,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
      ),
    );
  }
}
