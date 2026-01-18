import 'package:flutter_test/flutter_test.dart';
import 'package:courses_app_ui/models/course.dart';

void main() {
  group('Course Model', () {
    test('Course can be created with required fields', () {
      const course = Course(
        id: 1,
        title: 'Test Course',
        instructor: 'Test Instructor',
        image: 'test.jpg',
        duration: '1h 00m',
        rating: 4.5,
        lessons: 10,
        category: 'Test',
      );

      expect(course.id, 1);
      expect(course.title, 'Test Course');
      expect(course.instructor, 'Test Instructor');
      expect(course.image, 'test.jpg');
      expect(course.duration, '1h 00m');
      expect(course.rating, 4.5);
      expect(course.lessons, 10);
      expect(course.category, 'Test');
      expect(course.progress, isNull);
    });

    test('Course can be created with optional progress', () {
      const course = Course(
        id: 1,
        title: 'Test Course',
        instructor: 'Test Instructor',
        image: 'test.jpg',
        duration: '1h 00m',
        rating: 4.5,
        lessons: 10,
        category: 'Test',
        progress: 50,
      );

      expect(course.progress, 50);
    });

    test('Course copyWith works correctly', () {
      const original = Course(
        id: 1,
        title: 'Original',
        instructor: 'Instructor',
        image: 'image.jpg',
        duration: '1h',
        rating: 4.0,
        lessons: 5,
        category: 'Category',
      );

      final copy = original.copyWith(title: 'Modified', progress: 75);

      expect(copy.id, 1);
      expect(copy.title, 'Modified');
      expect(copy.instructor, 'Instructor');
      expect(copy.progress, 75);
    });
  });

  group('Category Model', () {
    test('Category can be created', () {
      const category = Category(
        id: 'test',
        label: 'Test Category',
        icon: '📚',
      );

      expect(category.id, 'test');
      expect(category.label, 'Test Category');
      expect(category.icon, '📚');
    });
  });

  group('MenuItem Model', () {
    test('MenuItem can be created with required fields', () {
      const item = MenuItem(
        icon: IconType.settings,
        label: 'Settings',
      );

      expect(item.icon, IconType.settings);
      expect(item.label, 'Settings');
      expect(item.badge, isNull);
      expect(item.hasToggle, false);
    });

    test('MenuItem can be created with optional fields', () {
      const item = MenuItem(
        icon: IconType.bell,
        label: 'Notifications',
        badge: '3 new',
        hasToggle: true,
      );

      expect(item.badge, '3 new');
      expect(item.hasToggle, true);
    });
  });
}
