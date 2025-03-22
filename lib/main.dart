import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/screens/onboarding_screen.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';
import 'package:mevivu_recipe_app/utils/custom_colors.dart';

void main() {
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
        // scaffoldBackgroundColor: Colors.yellow, 
        primarySwatch: primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: primaryColor,
        ).copyWith(
          secondary: secondaryColor,
        ),
        extensions: <ThemeExtension<dynamic>>[
          CustomColors(neutral: neutralColor),
        ],
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}
