// features/rider/presentation/rider_home_screen.dart

import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/routes/app_routes.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/common/custom_app_bar.dart';

class RiderHomeScreen extends StatefulWidget {
  const RiderHomeScreen({Key? key}) : super(key: key);

  @override
  State<RiderHomeScreen> createState() => _RiderHomeScreenState();
}

class _RiderHomeScreenState extends State<RiderHomeScreen> {
  int _selectedIndex = 0;
  String _userName = 'John';
  double _walletBalance = 250.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryLightColor,
            child: const Icon(Icons.person, color: AppColors.backgroundColor),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $_userName 👋',
              style: AppTextStyles.riderGreeting,
            ),
            Text(
              'Ready to ride?',
              style: AppTextStyles.riderStatus,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, 
              color: AppColors.textPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================
              // SEARCH DESTINATION BAR
              // ============================================
              _buildDestinationSearchBar(context),
              const SizedBox(height: 24),

              // ============================================
              // QUICK ACTIONS
              // ============================================
              _buildQuickActions(context),
              const SizedBox(height: 24),

              // ============================================
              // WALLET BALANCE CARD
              // ============================================
              _buildWalletCard(),
              const SizedBox(height: 24),

              // ============================================
              // RECENT LOCATIONS
              // ============================================
              _buildRecentLocations(),
              const SizedBox(height: 24),

              // ============================================
              // PROMOTIONAL BANNER
              // ============================================
              _buildPromoSection(),
              const SizedBox(height: 24),

              // ============================================
              // RIDE HISTORY PREVIEW
              // ============================================
              _buildRecentRidesPreview(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ============================================
  // DESTINATION SEARCH BAR
  // ============================================
  Widget _buildDestinationSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, AppRoutes.bookRide),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.backgroundLightColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, 
              color: AppColors.primaryColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where are you going?',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Set your destination',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, 
              color: AppColors.textSecondaryColor, size: 16),
          ],
        ),
      ),
    );
  }

  // ============================================
  // QUICK ACTIONS (Book Ride / Delivery)
  // ============================================
  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        // Book Ride
        Expanded(
          child: _QuickActionCard(
            icon: Icons.directions_car,
            label: 'Book Ride',
            subtitle: 'Taxi • Okada',
            color: AppColors.primaryColor,
            onTap: () => Navigator.pushNamed(context, AppRoutes.bookRide),
          ),
        ),
        const SizedBox(width: 12),
        // Request Delivery
        Expanded(
          child: _QuickActionCard(
            icon: Icons.local_shipping_outlined,
            label: 'Delivery',
            subtitle: 'Send Parcel',
            color: Color(0xFF00BCD4),
            onTap: () => Navigator.pushNamed(context, AppRoutes.bookDelivery),
          ),
        ),
      ],
    );
  }

  // ============================================
  // WALLET BALANCE CARD
  // ============================================
  Widget _buildWalletCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.primaryLightColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Wallet Balance',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.backgroundColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'GHS $_walletBalance',
            style: AppTextStyles.heading2.copyWith(
              color: AppColors.backgroundColor,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _WalletActionButton(
                  label: 'Add Money',
                  icon: Icons.add,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _WalletActionButton(
                  label: 'History',
                  icon: Icons.history,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================
  // RECENT LOCATIONS
  // ============================================
  Widget _buildRecentLocations() {
    final recentPlaces = [
      {'name': 'Office', 'address': '123 Business Street', 'icon': Icons.business},
      {'name': 'Home', 'address': '456 Residential Ave', 'icon': Icons.home},
      {'name': 'Gym', 'address': '789 Fitness Road', 'icon': Icons.fitness_center},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saved Places',
          style: AppTextStyles.heading4,
        ),
        const SizedBox(height: 12),
        ...recentPlaces.map((place) => _LocationTile(
          name: place['name'] as String,
          address: place['address'] as String,
          icon: place['icon'] as IconData,
        )).toList(),
      ],
    );
  }

  // ============================================
  // PROMO SECTION
  // ============================================
  Widget _buildPromoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFFFB74D)),
      ),
      child: Row(
        children: [
          Text(
            '🎉',
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get 20% OFF',
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'On your next ride!',
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, 
            color: Color(0xFFFF9800), size: 16),
        ],
      ),
    );
  }

  // ============================================
  // RECENT RIDES PREVIEW
  // ============================================
  Widget _buildRecentRidesPreview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Rides',
              style: AppTextStyles.heading4,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.rideHistory),
              child: Text(
                'View All',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _RidePreviewCard(
          driverName: 'Ahmed',
          vehicleType: 'Taxi',
          fare: 'GHS 15.50',
          date: 'Today at 2:30 PM',
          rating: 4.8,
        ),
        const SizedBox(height: 8),
        _RidePreviewCard(
          driverName: 'Kofi',
          vehicleType: 'Okada',
          fare: 'GHS 8.00',
          date: 'Yesterday at 5:00 PM',
          rating: 5.0,
        ),
      ],
    );
  }

  // ============================================
  // BOTTOM NAVIGATION BAR
  // ============================================
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() => _selectedIndex = index);
        switch (index) {
          case 0:
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.rideHistory);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoutes.riderWallet);
            break;
          case 3:
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.textSecondaryColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_giftcard),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

// ============================================
// CUSTOM WIDGETS
// ============================================

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.backgroundColor, size: 24),
            ),
            const SizedBox(height: 12),
            Text(label, style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600)),
            Text(subtitle, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}

class _WalletActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _WalletActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.backgroundColor, size: 18),
            const SizedBox(width: 6),
            Text(label, style: AppTextStyles.buttonSmall),
          ],
        ),
      ),
    );
  }
}

class _LocationTile extends StatelessWidget {
  final String name;
  final String address;
  final IconData icon;

  const _LocationTile({
    required this.name,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                Text(address, style: AppTextStyles.caption),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.textSecondaryColor, size: 16),
        ],
      ),
    );
  }
}

class _RidePreviewCard extends StatelessWidget {
  final String driverName;
  final String vehicleType;
  final String fare;
  final String date;
  final double rating;

  const _RidePreviewCard({
    required this.driverName,
    required this.vehicleType,
    required this.fare,
    required this.date,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryColor.withOpacity(0.2),
            child: Icon(Icons.person, color: AppColors.primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(driverName, style: AppTextStyles.cardTitle),
                Text('$vehicleType • $date', style: AppTextStyles.cardSubtitle),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(fare, style: AppTextStyles.cardPrice),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFFFB74D), size: 16),
                  SizedBox(width: 4),
                  Text('$rating', style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}