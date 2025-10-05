import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shops/app.dart';
import 'package:shops/config/di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App());
}
