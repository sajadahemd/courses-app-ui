import { Play, Clock, Star } from "lucide-react";
import { Progress } from "@/components/ui/progress";

interface CourseCardProps {
  title: string;
  instructor: string;
  image: string;
  progress?: number;
  duration: string;
  rating: number;
  lessons: number;
  category: string;
  onClick?: () => void;
  variant?: "default" | "compact" | "featured";
  animationDelay?: number;
}

const CourseCard = ({
  title,
  instructor,
  image,
  progress,
  duration,
  rating,
  lessons,
  category,
  onClick,
  variant = "default",
  animationDelay = 0,
}: CourseCardProps) => {
  if (variant === "featured") {
    return (
      <div
        onClick={onClick}
        className="relative overflow-hidden rounded-2xl cursor-pointer group animate-fade-in-up"
        style={{ animationDelay: `${animationDelay}ms` }}
      >
        <div className="aspect-[16/9] relative">
          <img
            src={image}
            alt={title}
            className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
          />
          <div className="absolute inset-0 bg-gradient-to-t from-foreground/90 via-foreground/40 to-transparent" />
          <div className="absolute bottom-0 left-0 right-0 p-4">
            <span className="inline-block px-2 py-1 text-xs font-medium bg-primary text-primary-foreground rounded-full mb-2">
              {category}
            </span>
            <h3 className="text-lg font-semibold text-card mb-1 line-clamp-2">
              {title}
            </h3>
            <p className="text-sm text-card/80">{instructor}</p>
            <div className="flex items-center gap-3 mt-2 text-card/70 text-xs">
              <span className="flex items-center gap-1">
                <Star className="w-3 h-3 fill-chart-4 text-chart-4" />
                {rating}
              </span>
              <span className="flex items-center gap-1">
                <Clock className="w-3 h-3" />
                {duration}
              </span>
              <span>{lessons} lessons</span>
            </div>
          </div>
          <button className="absolute top-4 right-4 w-10 h-10 bg-card/20 backdrop-blur-sm rounded-full flex items-center justify-center text-card hover:bg-primary hover:text-primary-foreground transition-all duration-200 active:scale-90">
            <Play className="w-5 h-5 fill-current" />
          </button>
        </div>
      </div>
    );
  }

  if (variant === "compact") {
    return (
      <div
        onClick={onClick}
        className="flex gap-3 p-3 bg-card rounded-xl cursor-pointer group transition-all duration-200 hover:shadow-md active:scale-[0.98] animate-fade-in"
        style={{ animationDelay: `${animationDelay}ms` }}
      >
        <div className="relative w-20 h-20 rounded-lg overflow-hidden flex-shrink-0">
          <img
            src={image}
            alt={title}
            className="w-full h-full object-cover transition-transform duration-300 group-hover:scale-110"
          />
          {progress !== undefined && progress > 0 && (
            <div className="absolute bottom-0 left-0 right-0 h-1 bg-muted">
              <div 
                className="h-full bg-primary transition-all duration-300"
                style={{ width: `${progress}%` }}
              />
            </div>
          )}
        </div>
        <div className="flex-1 min-w-0">
          <h4 className="font-medium text-sm line-clamp-2 mb-1">{title}</h4>
          <p className="text-xs text-muted-foreground mb-2">{instructor}</p>
          <div className="flex items-center gap-2 text-xs text-muted-foreground">
            <span className="flex items-center gap-1">
              <Star className="w-3 h-3 fill-chart-4 text-chart-4" />
              {rating}
            </span>
            <span>•</span>
            <span>{lessons} lessons</span>
          </div>
        </div>
      </div>
    );
  }

  return (
    <div
      onClick={onClick}
      className="bg-card rounded-2xl overflow-hidden cursor-pointer group transition-all duration-200 hover:shadow-lg active:scale-[0.98] animate-fade-in-up"
      style={{ animationDelay: `${animationDelay}ms` }}
    >
      <div className="relative aspect-video overflow-hidden">
        <img
          src={image}
          alt={title}
          className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
        />
        <span className="absolute top-3 left-3 px-2 py-1 text-xs font-medium bg-card/90 backdrop-blur-sm rounded-full">
          {category}
        </span>
        <button className="absolute bottom-3 right-3 w-10 h-10 bg-primary/90 backdrop-blur-sm rounded-full flex items-center justify-center text-primary-foreground hover:bg-primary transition-all duration-200 active:scale-90 opacity-0 group-hover:opacity-100 translate-y-2 group-hover:translate-y-0">
          <Play className="w-5 h-5 fill-current" />
        </button>
      </div>
      <div className="p-4">
        <h3 className="font-semibold line-clamp-2 mb-1">{title}</h3>
        <p className="text-sm text-muted-foreground mb-3">{instructor}</p>
        
        {progress !== undefined && progress > 0 && (
          <div className="mb-3">
            <div className="flex justify-between text-xs text-muted-foreground mb-1">
              <span>Progress</span>
              <span>{progress}%</span>
            </div>
            <Progress value={progress} className="h-1.5" />
          </div>
        )}
        
        <div className="flex items-center gap-3 text-sm text-muted-foreground">
          <span className="flex items-center gap-1">
            <Star className="w-4 h-4 fill-chart-4 text-chart-4" />
            {rating}
          </span>
          <span className="flex items-center gap-1">
            <Clock className="w-4 h-4" />
            {duration}
          </span>
          <span>{lessons} lessons</span>
        </div>
      </div>
    </div>
  );
};

export default CourseCard;
