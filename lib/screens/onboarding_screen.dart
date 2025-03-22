import 'package:flutter/material.dart';
import 'package:mevivu_recipe_app/components/onboarding_buttom.dart';
import 'package:mevivu_recipe_app/layout/screen_layout.dart';
import 'package:mevivu_recipe_app/screens/home_screen.dart';
import 'package:mevivu_recipe_app/utils/color_themes.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0.7, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.darken,
              child: Image.asset(
                'assets/images/onboarding_image.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bắt đầu với những \nmón ăn",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                OnboardingButton(
                  title: "Bắt đầu",
                  iconPath: 'assets/icons/right_arrow_icon.png',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ScreenLayout()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


