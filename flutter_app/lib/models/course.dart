/// Course model representing a learning course.
class Course {
  final int id;
  final String title;
  final String instructor;
  final String image;
  final String duration;
  final double rating;
  final int lessons;
  final String category;
  final int? progress;

  const Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.image,
    required this.duration,
    required this.rating,
    required this.lessons,
    required this.category,
    this.progress,
  });

  Course copyWith({
    int? id,
    String? title,
    String? instructor,
    String? image,
    String? duration,
    double? rating,
    int? lessons,
    String? category,
    int? progress,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      image: image ?? this.image,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      lessons: lessons ?? this.lessons,
      category: category ?? this.category,
      progress: progress ?? this.progress,
    );
  }
}

/// Category model for course categories.
class Category {
  final String id;
  final String label;
  final String icon;

  const Category({
    required this.id,
    required this.label,
    required this.icon,
  });
}

/// Menu item for profile screen.
class MenuItem {
  final IconType icon;
  final String label;
  final String? badge;
  final bool hasToggle;

  const MenuItem({
    required this.icon,
    required this.label,
    this.badge,
    this.hasToggle = false,
  });
}

/// Icon types used in the app.
enum IconType {
  award,
  creditCard,
  bell,
  moon,
  helpCircle,
  settings,
}
