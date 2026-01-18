import { Search, X } from "lucide-react";
import { useState } from "react";

interface SearchBarProps {
  placeholder?: string;
  value?: string;
  onChange?: (value: string) => void;
}

const SearchBar = ({ 
  placeholder = "Search courses...", 
  value = "", 
  onChange 
}: SearchBarProps) => {
  const [isFocused, setIsFocused] = useState(false);

  return (
    <div 
      className={`relative flex items-center transition-all duration-200 ${
        isFocused ? "scale-[1.02]" : ""
      }`}
    >
      <Search className={`absolute left-4 w-5 h-5 transition-colors duration-200 ${
        isFocused ? "text-primary" : "text-muted-foreground"
      }`} />
      <input
        type="text"
        placeholder={placeholder}
        value={value}
        onChange={(e) => onChange?.(e.target.value)}
        onFocus={() => setIsFocused(true)}
        onBlur={() => setIsFocused(false)}
        className="w-full h-12 pl-12 pr-10 bg-card rounded-2xl border border-border text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all duration-200"
      />
      {value && (
        <button
          onClick={() => onChange?.("")}
          className="absolute right-4 w-5 h-5 flex items-center justify-center text-muted-foreground hover:text-foreground transition-colors"
        >
          <X className="w-4 h-4" />
        </button>
      )}
    </div>
  );
};

export default SearchBar;
