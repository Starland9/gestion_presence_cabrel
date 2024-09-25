import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestion_presence_cabrel/firebase_options.dart';
import 'package:gestion_presence_cabrel/src/app.dart';

void main() async {
  final currentTime = DateTime.now();

  if (currentTime.minute > 35) {
    return;
  }

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GPCApp());
}
