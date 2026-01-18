interface CategoryChipProps {
  label: string;
  icon?: string;
  isActive?: boolean;
  onClick?: () => void;
}

const CategoryChip = ({ label, icon, isActive, onClick }: CategoryChipProps) => {
  return (
    <button
      onClick={onClick}
      className={`flex items-center gap-2 px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-all duration-200 active:scale-95 ${
        isActive
          ? "bg-primary text-primary-foreground shadow-md"
          : "bg-card text-foreground hover:bg-accent"
      }`}
    >
      {icon && <span className="text-base">{icon}</span>}
      {label}
    </button>
  );
};

export default CategoryChip;
