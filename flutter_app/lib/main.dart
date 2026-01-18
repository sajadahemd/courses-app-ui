import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/screens.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const CoursesApp());
}

/// Main application widget.
class CoursesApp extends StatelessWidget {
  const CoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes with 404 screen
        return MaterialPageRoute(
          builder: (context) => const NotFoundScreen(),
        );
      },
    );
  }
}

/// Main screen with bottom navigation.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _activeTab = 'home';

  Widget _buildScreen() {
    switch (_activeTab) {
      case 'home':
        return const HomeScreen();
      case 'explore':
        return const ExploreScreen();
      case 'my-courses':
        return const MyCoursesScreen();
      case 'profile':
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildScreen(),
      ),
      bottomNavigationBar: BottomNav(
        activeTab: _activeTab,
        onTabChange: (tab) => setState(() => _activeTab = tab),
      ),
    );
  }
}
