import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Tab item for bottom navigation.
class NavTab {
  final String id;
  final String label;
  final IconData icon;

  const NavTab({
    required this.id,
    required this.label,
    required this.icon,
  });
}

/// Bottom navigation bar widget matching the React BottomNav component.
class BottomNav extends StatelessWidget {
  final String activeTab;
  final ValueChanged<String> onTabChange;

  const BottomNav({
    super.key,
    required this.activeTab,
    required this.onTabChange,
  });

  static const List<NavTab> tabs = [
    NavTab(id: 'home', label: 'Home', icon: Icons.home_outlined),
    NavTab(id: 'explore', label: 'Explore', icon: Icons.search),
    NavTab(id: 'my-courses', label: 'My Courses', icon: Icons.menu_book_outlined),
    NavTab(id: 'profile', label: 'Profile', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs.map((tab) {
              final isActive = activeTab == tab.id;
              return Expanded(
                child: InkWell(
                  onTap: () => onTabChange(tab.id),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              isActive ? _getFilledIcon(tab.icon) : tab.icon,
                              color: isActive
                                  ? AppColors.primary
                                  : AppColors.muted,
                              size: 24,
                            ),
                            if (isActive)
                              Positioned(
                                bottom: -6,
                                child: Container(
                                  width: 4,
                                  height: 4,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isActive
                                ? AppColors.primary
                                : AppColors.muted.withOpacity(0.7),
                          ),
                          child: Text(tab.label),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  IconData _getFilledIcon(IconData outlinedIcon) {
    switch (outlinedIcon) {
      case Icons.home_outlined:
        return Icons.home;
      case Icons.search:
        return Icons.search;
      case Icons.menu_book_outlined:
        return Icons.menu_book;
      case Icons.person_outline:
        return Icons.person;
      default:
        return outlinedIcon;
    }
  }
}
