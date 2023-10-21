import 'package:flutter/material.dart';
import 'package:kifah/screens/main_screen.dart';
import 'package:kifah/screens/onboarding_screens/on_boarding_screen/onboardingscreen.dart';
import 'package:kifah/screens/splachscreen/splachscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplachScreen(),
    );
  }
}
