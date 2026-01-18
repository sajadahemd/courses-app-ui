import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/course.dart';
import '../widgets/course_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/search_bar.dart' as app;

/// Explore screen matching the React ExploreScreen component.
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _searchQuery = '';
  String _activeCategory = 'all';

  static const List<Category> categories = [
    Category(id: 'all', label: 'All Courses', icon: '📚'),
    Category(id: 'design', label: 'UI/UX Design', icon: '🎨'),
    Category(id: 'coding', label: 'Programming', icon: '💻'),
    Category(id: 'business', label: 'Business', icon: '📈'),
    Category(id: 'photo', label: 'Photography', icon: '📷'),
    Category(id: 'marketing', label: 'Marketing', icon: '📣'),
  ];

  static const List<Course> allCourses = [
    Course(
      id: 1,
      title: 'Complete UI/UX Design Masterclass',
      instructor: 'Sarah Johnson',
      image: 'assets/images/course-design.jpg',
      duration: '12h 30m',
      rating: 4.9,
      lessons: 48,
      category: 'Design',
    ),
    Course(
      id: 2,
      title: 'React & TypeScript for Beginners',
      instructor: 'Michael Chen',
      image: 'assets/images/course-coding.jpg',
      duration: '8h 15m',
      rating: 4.8,
      lessons: 36,
      category: 'Coding',
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
    ),
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
    Course(
      id: 6,
      title: 'Brand Strategy & Identity',
      instructor: 'Lisa Anderson',
      image: 'assets/images/course-design.jpg',
      duration: '7h 30m',
      rating: 4.8,
      lessons: 32,
      category: 'Business',
    ),
  ];

  static const List<String> popularTopics = [
    '🎨 UI Design',
    '⚛️ React',
    '📊 Data Science',
    '🤖 AI/ML',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Explore',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 16),

          // Search Bar
          app.SearchBar(
            placeholder: 'Search courses, instructors...',
            value: _searchQuery,
            onChange: (value) => setState(() => _searchQuery = value),
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
                isActive: _activeCategory == categories[index].id,
                onTap: () => setState(() => _activeCategory = categories[index].id),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Popular Topics
          const Text(
            'Popular Topics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: popularTopics.length,
            itemBuilder: (context, index) {
              final topic = popularTopics[index];
              final parts = topic.split(' ');
              final emoji = parts[0];
              final label = parts.sublist(1).join(' ');
              
              return GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        emoji,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '50+ courses',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.muted,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // All Courses
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Courses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              Text(
                '${allCourses.length} courses',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.muted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...allCourses.map((course) => Padding(
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
