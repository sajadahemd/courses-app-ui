import { useState } from "react";
import CourseCard from "@/components/CourseCard";
import courseCoding from "@/assets/course-coding.jpg";
import courseBusiness from "@/assets/course-business.jpg";
import courseDesign from "@/assets/course-design.jpg";
import coursePhoto from "@/assets/course-photo.jpg";

const tabs = ["In Progress", "Completed", "Saved"];

const inProgressCourses = [
  {
    id: 1,
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
    id: 2,
    title: "Digital Marketing Fundamentals",
    instructor: "Emma Williams",
    image: courseBusiness,
    duration: "6h 45m",
    rating: 4.7,
    lessons: 28,
    category: "Business",
    progress: 30,
  },
  {
    id: 3,
    title: "Complete UI/UX Design Masterclass",
    instructor: "Sarah Johnson",
    image: courseDesign,
    duration: "12h 30m",
    rating: 4.9,
    lessons: 48,
    category: "Design",
    progress: 85,
  },
];

const completedCourses = [
  {
    id: 4,
    title: "JavaScript Essentials",
    instructor: "John Smith",
    image: courseCoding,
    duration: "6h 00m",
    rating: 4.7,
    lessons: 24,
    category: "Coding",
    progress: 100,
  },
  {
    id: 5,
    title: "Mobile Photography Masterclass",
    instructor: "David Lee",
    image: coursePhoto,
    duration: "5h 20m",
    rating: 4.6,
    lessons: 22,
    category: "Photography",
    progress: 100,
  },
];

const savedCourses = [
  {
    id: 6,
    title: "Advanced JavaScript Patterns",
    instructor: "Alex Thompson",
    image: courseCoding,
    duration: "10h 00m",
    rating: 4.9,
    lessons: 42,
    category: "Coding",
  },
  {
    id: 7,
    title: "Brand Strategy & Identity",
    instructor: "Lisa Anderson",
    image: courseDesign,
    duration: "7h 30m",
    rating: 4.8,
    lessons: 32,
    category: "Business",
  },
];

const MyCoursesScreen = () => {
  const [activeTab, setActiveTab] = useState(0);

  const getCourses = () => {
    switch (activeTab) {
      case 0:
        return inProgressCourses;
      case 1:
        return completedCourses;
      case 2:
        return savedCourses;
      default:
        return [];
    }
  };

  const courses = getCourses();

  return (
    <div className="animate-fade-in">
      {/* Header */}
      <header className="mb-6">
        <h1 className="text-2xl font-bold">My Courses</h1>
      </header>

      {/* Tabs */}
      <div className="flex gap-2 mb-6">
        {tabs.map((tab, index) => (
          <button
            key={tab}
            onClick={() => setActiveTab(index)}
            className={`flex-1 py-3 px-4 rounded-xl font-medium text-sm transition-all duration-200 active:scale-95 ${
              activeTab === index
                ? "bg-primary text-primary-foreground shadow-md"
                : "bg-card text-muted-foreground hover:bg-accent"
            }`}
          >
            {tab}
          </button>
        ))}
      </div>

      {/* Stats */}
      <section className="grid grid-cols-3 gap-3 mb-6">
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in">
          <p className="text-2xl font-bold text-primary">{inProgressCourses.length}</p>
          <p className="text-xs text-muted-foreground">In Progress</p>
        </div>
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in" style={{ animationDelay: "50ms" }}>
          <p className="text-2xl font-bold text-chart-2">{completedCourses.length}</p>
          <p className="text-xs text-muted-foreground">Completed</p>
        </div>
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in" style={{ animationDelay: "100ms" }}>
          <p className="text-2xl font-bold text-chart-3">{savedCourses.length}</p>
          <p className="text-xs text-muted-foreground">Saved</p>
        </div>
      </section>

      {/* Courses List */}
      <section>
        {courses.length > 0 ? (
          <div className="space-y-3">
            {courses.map((course, index) => (
              <CourseCard 
                key={course.id} 
                {...course} 
                variant="compact"
                animationDelay={index * 50}
              />
            ))}
          </div>
        ) : (
          <div className="text-center py-12 text-muted-foreground">
            <p>No courses yet</p>
          </div>
        )}
      </section>
    </div>
  );
};

export default MyCoursesScreen;
