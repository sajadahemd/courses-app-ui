import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../widgets/category_chip.dart';

/// Home screen matching the React HomeScreen component.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Category> categories = [
    Category(id: 'all', label: 'All', icon: '🎯'),
    Category(id: 'design', label: 'Design', icon: '🎨'),
    Category(id: 'coding', label: 'Coding', icon: '💻'),
    Category(id: 'business', label: 'Business', icon: '📈'),
    Category(id: 'photo', label: 'Photography', icon: '📷'),
  ];

  static const Course featuredCourse = Course(
    id: 1,
    title: 'Complete UI/UX Design Masterclass',
    instructor: 'Sarah Johnson',
    image: 'assets/images/course-design.jpg',
    duration: '12h 30m',
    rating: 4.9,
    lessons: 48,
    category: 'Design',
  );

  static const List<Course> continueLearning = [
    Course(
      id: 2,
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
      id: 3,
      title: 'Digital Marketing Fundamentals',
      instructor: 'Emma Williams',
      image: 'assets/images/course-business.jpg',
      duration: '6h 45m',
      rating: 4.7,
      lessons: 28,
      category: 'Business',
      progress: 30,
    ),
  ];

  static const List<Course> recommendedCourses = [
    Course(
      id: 4,
      title: 'Mobile Photography Masterclass',
      instructor: 'David Lee',
      image: 'assets/images/course-photo.jpg',
      duration: '5h 20m',
      rating: 4.6,
      lessons: 22,
      category: 'Photography',
    ),
    Course(
      id: 5,
      title: 'Advanced JavaScript Patterns',
      instructor: 'Alex Thompson',
      image: 'assets/images/course-coding.jpg',
      duration: '10h 00m',
      rating: 4.9,
      lessons: 42,
      category: 'Coding',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back 👋',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Hi, Alex!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                      color: AppColors.foreground,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.destructive,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Featured Course
          CourseCard(
            course: featuredCourse,
            variant: CourseCardVariant.featured,
          ),
          const SizedBox(height: 24),

          // Categories
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) => CategoryChip(
                label: categories[index].label,
                icon: categories[index].icon,
                isActive: index == 0,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Continue Learning
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Continue Learning',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...continueLearning.map((course) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CourseCard(
              course: course,
              variant: CourseCardVariant.compact,
            ),
          )),
          const SizedBox(height: 12),

          // Recommended
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...recommendedCourses.map((course) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CourseCard(
              course: course,
              variant: CourseCardVariant.defaultCard,
            ),
          )),
          // Bottom padding for navigation
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
