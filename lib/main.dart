import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hilmi_berkay_ozdemir/di/dependency_injection.dart';
import 'package:hilmi_berkay_ozdemir/di/init_adapter.dart';
import 'package:hilmi_berkay_ozdemir/routes/routes.dart';
import 'package:network/network.dart';

void main({bool isTesting = true}) async {
  await runZonedGuarded<Future<void>>(() async {
    final features = <InitializationAdapter>[
      DependencyInjection.shared,
    ];
    // this is the app configurations this is launch button of application
    for (final feature in features) {
      await feature.initialize();
      NetworkLogger.log.d('${feature.runtimeType} initialized');
    }
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stack) {
    NetworkLogger.log.e(error, stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hilmi Berkay Özdemir',
      routerConfig: router,
    );
  }
}
