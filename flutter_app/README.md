# Courses App UI - Flutter

A Flutter implementation of the Courses App UI, converted from the original React/TypeScript template.

## Features

- **Home Screen**: Welcome message, featured course, categories, continue learning section, and recommended courses
- **Explore Screen**: Search functionality, category filters, popular topics grid, and all courses listing
- **My Courses Screen**: Tab-based navigation (In Progress, Completed, Saved), stats overview, and course list
- **Profile Screen**: User profile, stats (courses, hours, certificates), premium banner, settings menu, and sign out

## Design System

The app uses a custom design system with:
- **Primary Color**: Green (`#089968`) - used for CTAs and highlights
- **Typography**: Work Sans font family via Google Fonts
- **Consistent spacing and border radius** matching the original React design
- **Light and Dark theme** support

## Project Structure

```
flutter_app/
├── lib/
│   ├── main.dart              # App entry point
│   ├── models/
│   │   └── course.dart        # Data models (Course, Category, MenuItem)
│   ├── screens/
│   │   ├── home_screen.dart       # Home tab
│   │   ├── explore_screen.dart    # Explore tab
│   │   ├── my_courses_screen.dart # My Courses tab
│   │   ├── profile_screen.dart    # Profile tab
│   │   ├── not_found_screen.dart  # 404 page
│   │   └── screens.dart           # Barrel export
│   ├── theme/
│   │   └── app_theme.dart     # Theme configuration and colors
│   └── widgets/
│       ├── bottom_nav.dart    # Bottom navigation bar
│       ├── category_chip.dart # Category filter chip
│       ├── course_card.dart   # Course card (3 variants)
│       ├── search_bar.dart    # Search input field
│       └── widgets.dart       # Barrel export
├── assets/
│   └── images/                # Course images
├── test/
│   └── models_test.dart       # Unit tests
└── pubspec.yaml               # Dependencies
```

## Components

### CourseCard
Three variants matching the React implementation:
- `featured`: Large hero card with gradient overlay
- `compact`: Horizontal card with thumbnail
- `default`: Standard vertical card with full details

### BottomNav
Custom bottom navigation with:
- Active/inactive states
- Dot indicator for selected tab
- Icon animations

### CategoryChip
Pill-shaped filter buttons with:
- Emoji icons
- Active state styling

### SearchBar
Text input with:
- Search icon
- Clear button
- Focus animations

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK

### Installation

```bash
# Navigate to the flutter app directory
cd flutter_app

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Running Tests

```bash
flutter test
```

## Original React App

This Flutter app is a conversion of the React app in the parent directory, which uses:
- Vite
- TypeScript
- React
- shadcn-ui
- Tailwind CSS

## Screenshots

The UI matches the original React implementation with:
- Bottom navigation for tab switching
- Scrollable content areas
- Card-based course displays
- Consistent typography and colors
