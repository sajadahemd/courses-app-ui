import { useState } from "react";
import SearchBar from "@/components/SearchBar";
import CategoryChip from "@/components/CategoryChip";
import CourseCard from "@/components/CourseCard";
import courseDesign from "@/assets/course-design.jpg";
import courseCoding from "@/assets/course-coding.jpg";
import courseBusiness from "@/assets/course-business.jpg";
import coursePhoto from "@/assets/course-photo.jpg";

const categories = [
  { id: "all", label: "All Courses", icon: "📚" },
  { id: "design", label: "UI/UX Design", icon: "🎨" },
  { id: "coding", label: "Programming", icon: "💻" },
  { id: "business", label: "Business", icon: "📈" },
  { id: "photo", label: "Photography", icon: "📷" },
  { id: "marketing", label: "Marketing", icon: "📣" },
];

const allCourses = [
  {
    id: 1,
    title: "Complete UI/UX Design Masterclass",
    instructor: "Sarah Johnson",
    image: courseDesign,
    duration: "12h 30m",
    rating: 4.9,
    lessons: 48,
    category: "Design",
  },
  {
    id: 2,
    title: "React & TypeScript for Beginners",
    instructor: "Michael Chen",
    image: courseCoding,
    duration: "8h 15m",
    rating: 4.8,
    lessons: 36,
    category: "Coding",
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
  },
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
  {
    id: 6,
    title: "Brand Strategy & Identity",
    instructor: "Lisa Anderson",
    image: courseDesign,
    duration: "7h 30m",
    rating: 4.8,
    lessons: 32,
    category: "Business",
  },
];

const ExploreScreen = () => {
  const [searchQuery, setSearchQuery] = useState("");
  const [activeCategory, setActiveCategory] = useState("all");

  return (
    <div className="animate-fade-in">
      {/* Header */}
      <header className="mb-6">
        <h1 className="text-2xl font-bold mb-4">Explore</h1>
        <SearchBar 
          value={searchQuery} 
          onChange={setSearchQuery}
          placeholder="Search courses, instructors..."
        />
      </header>

      {/* Categories */}
      <section className="mb-6">
        <div className="flex gap-2 overflow-x-auto pb-2 -mx-4 px-4 scrollbar-hide">
          {categories.map((cat) => (
            <CategoryChip
              key={cat.id}
              label={cat.label}
              icon={cat.icon}
              isActive={activeCategory === cat.id}
              onClick={() => setActiveCategory(cat.id)}
            />
          ))}
        </div>
      </section>

      {/* Popular Topics */}
      <section className="mb-6">
        <h2 className="text-lg font-semibold mb-4">Popular Topics</h2>
        <div className="grid grid-cols-2 gap-3">
          {["🎨 UI Design", "⚛️ React", "📊 Data Science", "🤖 AI/ML"].map((topic, index) => (
            <button 
              key={topic}
              className="p-4 bg-card rounded-xl text-left hover:bg-accent transition-all active:scale-95 animate-fade-in"
              style={{ animationDelay: `${index * 50}ms` }}
            >
              <span className="text-lg">{topic.split(" ")[0]}</span>
              <p className="font-medium mt-1">{topic.split(" ").slice(1).join(" ")}</p>
              <p className="text-xs text-muted-foreground mt-1">50+ courses</p>
            </button>
          ))}
        </div>
      </section>

      {/* All Courses */}
      <section>
        <div className="flex items-center justify-between mb-4">
          <h2 className="text-lg font-semibold">All Courses</h2>
          <span className="text-sm text-muted-foreground">{allCourses.length} courses</span>
        </div>
        <div className="grid grid-cols-1 gap-4">
          {allCourses.map((course, index) => (
            <CourseCard 
              key={course.id} 
              {...course}
              animationDelay={index * 50}
            />
          ))}
        </div>
      </section>
    </div>
  );
};

export default ExploreScreen;
