import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/course.dart';

/// Profile screen matching the React ProfileScreen component.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const List<MenuItem> menuItems = [
    MenuItem(icon: IconType.award, label: 'Achievements', badge: '3 new'),
    MenuItem(icon: IconType.creditCard, label: 'Payment Methods'),
    MenuItem(icon: IconType.bell, label: 'Notifications', hasToggle: true),
    MenuItem(icon: IconType.moon, label: 'Dark Mode', hasToggle: true),
    MenuItem(icon: IconType.helpCircle, label: 'Help & Support'),
    MenuItem(icon: IconType.settings, label: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          // Header - Profile Section
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary.withOpacity(0.2),
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: Container(
                          color: AppColors.primary,
                          alignment: Alignment.center,
                          child: const Text(
                            'A',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryForeground,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.chart2,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.background,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Alex Johnson',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'alex.johnson@email.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Stats
          Row(
            children: [
              _buildStatCard(
                value: '12',
                label: 'Courses',
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              _buildStatCard(
                value: '48',
                label: 'Hours',
                color: AppColors.chart2,
              ),
              const SizedBox(width: 12),
              _buildStatCard(
                value: '8',
                label: 'Certificates',
                color: AppColors.chart4,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Premium Banner
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.chart3],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upgrade to',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryForeground.withOpacity(0.9),
                        ),
                      ),
                      const Text(
                        'LearnFlow Pro',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryForeground,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Get unlimited access to all courses',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryForeground.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.card,
                    foregroundColor: AppColors.foreground,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Upgrade',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Menu Items
          Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: menuItems.map((item) => _buildMenuItem(item)).toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Logout Button
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.destructive.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.logout,
                    size: 20,
                    color: AppColors.destructive,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.destructive,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom padding for navigation
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.muted,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getIcon(item.icon),
                size: 20,
                color: AppColors.accentForeground,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.foreground,
                ),
              ),
            ),
            if (item.badge != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  item.badge!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryForeground,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
            if (item.hasToggle)
              Switch(
                value: false,
                onChanged: (_) {},
              )
            else
              Icon(
                Icons.chevron_right,
                size: 20,
                color: AppColors.muted,
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIcon(IconType iconType) {
    switch (iconType) {
      case IconType.award:
        return Icons.emoji_events_outlined;
      case IconType.creditCard:
        return Icons.credit_card_outlined;
      case IconType.bell:
        return Icons.notifications_outlined;
      case IconType.moon:
        return Icons.dark_mode_outlined;
      case IconType.helpCircle:
        return Icons.help_outline;
      case IconType.settings:
        return Icons.settings_outlined;
    }
  }
}
