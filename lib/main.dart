import 'package:flutter/material.dart';
import 'package:air_feed/onboarding_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const MaterialApp(home: OnboardingScreen(),));
}

