import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'providers/workout_provider.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  // YOLO: Running app without tests first! 🎯
  runApp(const FitlyApp());
}

class FitlyApp extends StatelessWidget {
  const FitlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: MaterialApp(
        title: 'Fitly',
        theme: AppTheme.darkTheme,
        home: const MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
