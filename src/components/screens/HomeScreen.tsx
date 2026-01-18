import { Bell } from "lucide-react";
import CourseCard from "@/components/CourseCard";
import CategoryChip from "@/components/CategoryChip";
import courseDesign from "@/assets/course-design.jpg";
import courseCoding from "@/assets/course-coding.jpg";
import courseBusiness from "@/assets/course-business.jpg";
import coursePhoto from "@/assets/course-photo.jpg";

const categories = [
  { id: "all", label: "All", icon: "🎯" },
  { id: "design", label: "Design", icon: "🎨" },
  { id: "coding", label: "Coding", icon: "💻" },
  { id: "business", label: "Business", icon: "📈" },
  { id: "photo", label: "Photography", icon: "📷" },
];

const featuredCourse = {
  id: 1,
  title: "Complete UI/UX Design Masterclass",
  instructor: "Sarah Johnson",
  image: courseDesign,
  duration: "12h 30m",
  rating: 4.9,
  lessons: 48,
  category: "Design",
};

const continueLearning = [
  {
    id: 2,
    title: "React & TypeScript for Beginners",
    instructor: "Michael Chen",
    image: courseCoding,
    duration: "8h 15m",
    rating: 4.8,
    lessons: 36,
    category: "Coding",
    progress: 65,
  },
  {
    id: 3,
    title: "Digital Marketing Fundamentals",
    instructor: "Emma Williams",
    image: courseBusiness,
    duration: "6h 45m",
    rating: 4.7,
    lessons: 28,
    category: "Business",
    progress: 30,
  },
];

const recommendedCourses = [
  {
    id: 4,
    title: "Mobile Photography Masterclass",
    instructor: "David Lee",
    image: coursePhoto,
    duration: "5h 20m",
    rating: 4.6,
    lessons: 22,
    category: "Photography",
  },
  {
    id: 5,
    title: "Advanced JavaScript Patterns",
    instructor: "Alex Thompson",
    image: courseCoding,
    duration: "10h 00m",
    rating: 4.9,
    lessons: 42,
    category: "Coding",
  },
];

const HomeScreen = () => {
  return (
    <div className="animate-fade-in">
      {/* Header */}
      <header className="flex items-center justify-between mb-6">
        <div>
          <p className="text-muted-foreground text-sm">Welcome back 👋</p>
          <h1 className="text-2xl font-bold">Hi, Alex!</h1>
        </div>
        <button className="relative w-10 h-10 bg-card rounded-full flex items-center justify-center hover:bg-accent transition-colors active:scale-95">
          <Bell className="w-5 h-5" />
          <span className="absolute top-2 right-2 w-2 h-2 bg-destructive rounded-full" />
        </button>
      </header>

      {/* Featured Course */}
      <section className="mb-6">
        <CourseCard {...featuredCourse} variant="featured" />
      </section>

      {/* Categories */}
      <section className="mb-6">
        <div className="flex gap-2 overflow-x-auto pb-2 -mx-4 px-4 scrollbar-hide">
          {categories.map((cat, index) => (
            <CategoryChip
              key={cat.id}
              label={cat.label}
              icon={cat.icon}
              isActive={index === 0}
            />
          ))}
        </div>
      </section>

      {/* Continue Learning */}
      <section className="mb-6">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold">Continue Learning</h2>
          <button className="text-sm text-primary font-medium">See All</button>
        </div>
        <div className="space-y-3">
          {continueLearning.map((course, index) => (
            <CourseCard 
              key={course.id} 
              {...course} 
              variant="compact"
              animationDelay={index * 100}
            />
          ))}
        </div>
      </section>

      {/* Recommended */}
      <section className="mb-6">
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold">Recommended for You</h2>
          <button className="text-sm text-primary font-medium">See All</button>
        </div>
        <div className="grid grid-cols-1 gap-4">
          {recommendedCourses.map((course, index) => (
            <CourseCard 
              key={course.id} 
              {...course}
              animationDelay={index * 100}
            />
          ))}
        </div>
      </section>
    </div>
  );
};

export default HomeScreen;
