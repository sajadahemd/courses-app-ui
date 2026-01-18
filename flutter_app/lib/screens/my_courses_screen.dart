import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';

/// My Courses screen matching the React MyCoursesScreen component.
class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  int _activeTab = 0;

  static const List<String> tabs = ['In Progress', 'Completed', 'Saved'];

  static const List<Course> inProgressCourses = [
    Course(
      id: 1,
      title: 'React & TypeScript for Beginners',
      instructor: 'Michael Chen',
      image: 'assets/images/course-coding.jpg',
      duration: '8h 15m',
      rating: 4.8,
      lessons: 36,
      category: 'Coding',
      progress: 65,
    ),
    Course(
      id: 2,
      title: 'Digital Marketing Fundamentals',
      instructor: 'Emma Williams',
      image: 'assets/images/course-business.jpg',
      duration: '6h 45m',
      rating: 4.7,
      lessons: 28,
      category: 'Business',
      progress: 30,
    ),
    Course(
      id: 3,
      title: 'Complete UI/UX Design Masterclass',
      instructor: 'Sarah Johnson',
      image: 'assets/images/course-design.jpg',
      duration: '12h 30m',
      rating: 4.9,
      lessons: 48,
      category: 'Design',
      progress: 85,
    ),
  ];

  static const List<Course> completedCourses = [
    Course(
      id: 4,
      title: 'JavaScript Essentials',
      instructor: 'John Smith',
      image: 'assets/images/course-coding.jpg',
      duration: '6h 00m',
      rating: 4.7,
      lessons: 24,
      category: 'Coding',
      progress: 100,
    ),
    Course(
      id: 5,
      title: 'Mobile Photography Masterclass',
      instructor: 'David Lee',
      image: 'assets/images/course-photo.jpg',
      duration: '5h 20m',
      rating: 4.6,
      lessons: 22,
      category: 'Photography',
      progress: 100,
    ),
  ];

  static const List<Course> savedCourses = [
    Course(
      id: 6,
      title: 'Advanced JavaScript Patterns',
      instructor: 'Alex Thompson',
      image: 'assets/images/course-coding.jpg',
      duration: '10h 00m',
      rating: 4.9,
      lessons: 42,
      category: 'Coding',
    ),
    Course(
      id: 7,
      title: 'Brand Strategy & Identity',
      instructor: 'Lisa Anderson',
      image: 'assets/images/course-design.jpg',
      duration: '7h 30m',
      rating: 4.8,
      lessons: 32,
      category: 'Business',
    ),
  ];

  List<Course> get _courses {
    switch (_activeTab) {
      case 0:
        return inProgressCourses;
      case 1:
        return completedCourses;
      case 2:
        return savedCourses;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'My Courses',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),

          // Tabs
          Row(
            children: List.generate(tabs.length, (index) {
              final isActive = _activeTab == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _activeTab = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(
                      right: index < tabs.length - 1 ? 8 : 0,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.primary : AppColors.card,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isActive
                              ? AppColors.primaryForeground
                              : AppColors.muted,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24),

          // Stats
          Row(
            children: [
              _buildStatCard(
                value: inProgressCourses.length.toString(),
                label: 'In Progress',
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              _buildStatCard(
                value: completedCourses.length.toString(),
                label: 'Completed',
                color: AppColors.chart2,
              ),
              const SizedBox(width: 12),
              _buildStatCard(
                value: savedCourses.length.toString(),
                label: 'Saved',
                color: AppColors.chart3,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Courses List
          if (_courses.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 48),
              alignment: Alignment.center,
              child: Text(
                'No courses yet',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.muted,
                ),
              ),
            )
          else
            ..._courses.map((course) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: CourseCard(
                course: course,
                variant: CourseCardVariant.compact,
              ),
            )),
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
}
