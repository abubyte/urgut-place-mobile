import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urgut_place/app.dart';
import 'package:urgut_place/config/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
