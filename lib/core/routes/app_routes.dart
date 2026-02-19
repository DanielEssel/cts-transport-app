// core/routes/app_routes.dart

class AppRoutes {
  // Auth Routes
  static const String splash = '/';  // ❌ THIS WAS MISSING!
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String otpVerification = '/otp-verification';
  static const String roleSelection = '/role-selection';

  // Rider Routes
  static const String riderHome = '/rider-home';
  static const String bookRide = '/book-ride';
  static const String activeRide = '/active-ride';
  static const String rideHistory = '/ride-history';
  static const String riderWallet = '/rider-wallet';

  // Delivery Routes
  static const String bookDelivery = '/book-delivery';
  static const String activeDelivery = '/active-delivery';
  static const String deliveryHistory = '/delivery-history';

  // Driver Routes
  static const String driverHome = '/driver-home';
  static const String availableRequests = '/available-requests';
  static const String activeTrip = '/active-trip';
  static const String tripHistory = '/trip-history';
  static const String earnings = '/earnings';
  static const String driverWallet = '/driver-wallet';
  static const String withdrawal = '/withdrawal';

  // Admin Routes
  static const String adminDashboard = '/admin-dashboard';
}