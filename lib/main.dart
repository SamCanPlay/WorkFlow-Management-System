import 'package:flutter/material.dart';
import 'app_router.dart';

void main() {
  runApp(const BuilderFlowApp());
}

class BuilderFlowApp extends StatelessWidget {
  const BuilderFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BuilderFlow',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF6F8FB),
      ),
      routerConfig: appRouter,
    );
  }
}
