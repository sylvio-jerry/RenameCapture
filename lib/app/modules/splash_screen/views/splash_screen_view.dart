import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rename_capture/app/modules/home/views/home_view.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            ClipRRect(
                child: Image.asset("assets/images/app_logo.jpeg",
                    width: 100, height: 100)),
            const SizedBox(width: 30),
            Text(
              "Welcome to",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white, fontFamily: 'Roboto'),
            ),
            const SizedBox(width: 10),
            Text(
              'Rename Capture',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!.copyWith(color: Colors.white, fontFamily: 'Lobster'),
            ),
            
          ],
        ),
      ),
      nextScreen: HomeView(),
      duration: 3000,
      backgroundColor: Theme.of(context).colorScheme.primary,
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 200,
      centered: true,
    );
  }
}
