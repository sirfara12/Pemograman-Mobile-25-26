import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './models/data_layer.dart';
import './models/plan_provider.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Plan Sirfara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
        ),
      ),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()), 
        child: const PlanScreen(),
      ),
    );
  }
}