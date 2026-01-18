import { 
  Settings, 
  Award, 
  CreditCard, 
  HelpCircle, 
  LogOut, 
  ChevronRight,
  Moon,
  Bell
} from "lucide-react";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Switch } from "@/components/ui/switch";

const menuItems = [
  { icon: Award, label: "Achievements", badge: "3 new" },
  { icon: CreditCard, label: "Payment Methods" },
  { icon: Bell, label: "Notifications", hasToggle: true },
  { icon: Moon, label: "Dark Mode", hasToggle: true },
  { icon: HelpCircle, label: "Help & Support" },
  { icon: Settings, label: "Settings" },
];

const ProfileScreen = () => {
  return (
    <div className="animate-fade-in">
      {/* Header */}
      <header className="text-center mb-8">
        <div className="relative inline-block mb-4">
          <Avatar className="w-24 h-24 border-4 border-primary/20">
            <AvatarImage src="https://api.dicebear.com/7.x/avataaars/svg?seed=Alex" />
            <AvatarFallback className="text-2xl bg-primary text-primary-foreground">A</AvatarFallback>
          </Avatar>
          <span className="absolute bottom-0 right-0 w-6 h-6 bg-chart-2 rounded-full border-4 border-background" />
        </div>
        <h1 className="text-2xl font-bold">Alex Johnson</h1>
        <p className="text-muted-foreground">alex.johnson@email.com</p>
      </header>

      {/* Stats */}
      <section className="grid grid-cols-3 gap-3 mb-8">
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in">
          <p className="text-2xl font-bold text-primary">12</p>
          <p className="text-xs text-muted-foreground">Courses</p>
        </div>
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in" style={{ animationDelay: "50ms" }}>
          <p className="text-2xl font-bold text-chart-2">48</p>
          <p className="text-xs text-muted-foreground">Hours</p>
        </div>
        <div className="bg-card p-4 rounded-xl text-center animate-scale-in" style={{ animationDelay: "100ms" }}>
          <p className="text-2xl font-bold text-chart-4">8</p>
          <p className="text-xs text-muted-foreground">Certificates</p>
        </div>
      </section>

      {/* Premium Banner */}
      <section className="mb-6">
        <div className="bg-gradient-to-r from-primary to-chart-3 p-4 rounded-2xl text-primary-foreground animate-fade-in-up">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm opacity-90">Upgrade to</p>
              <h3 className="text-lg font-bold">LearnFlow Pro</h3>
              <p className="text-sm opacity-80 mt-1">Get unlimited access to all courses</p>
            </div>
            <button className="px-4 py-2 bg-card text-foreground rounded-xl font-medium text-sm hover:bg-accent transition-colors active:scale-95">
              Upgrade
            </button>
          </div>
        </div>
      </section>

      {/* Menu Items */}
      <section className="bg-card rounded-2xl overflow-hidden">
        {menuItems.map((item, index) => {
          const Icon = item.icon;
          return (
            <button
              key={item.label}
              className="w-full flex items-center justify-between p-4 hover:bg-accent/50 transition-colors active:bg-accent animate-fade-in"
              style={{ animationDelay: `${index * 50}ms` }}
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-accent rounded-xl flex items-center justify-center">
                  <Icon className="w-5 h-5 text-accent-foreground" />
                </div>
                <span className="font-medium">{item.label}</span>
              </div>
              <div className="flex items-center gap-2">
                {item.badge && (
                  <span className="px-2 py-1 bg-primary text-primary-foreground text-xs rounded-full">
                    {item.badge}
                  </span>
                )}
                {item.hasToggle ? (
                  <Switch />
                ) : (
                  <ChevronRight className="w-5 h-5 text-muted-foreground" />
                )}
              </div>
            </button>
          );
        })}
      </section>

      {/* Logout */}
      <button className="w-full flex items-center justify-center gap-2 p-4 mt-6 bg-destructive/10 text-destructive rounded-2xl font-medium hover:bg-destructive/20 transition-colors active:scale-[0.98]">
        <LogOut className="w-5 h-5" />
        Sign Out
      </button>
    </div>
  );
};

export default ProfileScreen;
