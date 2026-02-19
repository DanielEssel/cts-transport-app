// riders_app/lib/main.dart

import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/app_routes.dart';
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';  // ✅ ADD THIS
import 'features/home/presentation/home_screen.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/signup_screen.dart';
import 'features/auth/presentation/otp_verification_screen.dart';
import 'features/auth/presentation/role_selection_screen.dart';

void main() {
  runApp(const RiderApp());
}

class RiderApp extends StatelessWidget {
  const RiderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTS Transport - Rider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        // Auth Routes
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnboardingScreen(),  // ✅ ADD THIS
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignupScreen(),
        AppRoutes.otpVerification: (context) => const OtpVerificationScreen(),
        AppRoutes.roleSelection: (context) => const RoleSelectionScreen(),
        
        // Rider Routes
        AppRoutes.riderHome: (context) => const RiderHomeScreen(),
      },
    );
  }
}