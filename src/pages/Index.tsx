import { useState } from "react";
import BottomNav from "@/components/BottomNav";
import HomeScreen from "@/components/screens/HomeScreen";
import ExploreScreen from "@/components/screens/ExploreScreen";
import MyCoursesScreen from "@/components/screens/MyCoursesScreen";
import ProfileScreen from "@/components/screens/ProfileScreen";

const Index = () => {
  const [activeTab, setActiveTab] = useState("home");

  const renderScreen = () => {
    switch (activeTab) {
      case "home":
        return <HomeScreen />;
      case "explore":
        return <ExploreScreen />;
      case "my-courses":
        return <MyCoursesScreen />;
      case "profile":
        return <ProfileScreen />;
      default:
        return <HomeScreen />;
    }
  };

  return (
    <div className="min-h-screen bg-background">
      {/* Mobile Container */}
      <div className="max-w-lg mx-auto min-h-screen relative">
        {/* Main Content */}
        <main className="px-4 pt-6 pb-24 overflow-y-auto">
          {renderScreen()}
        </main>

        {/* Bottom Navigation */}
        <BottomNav activeTab={activeTab} onTabChange={setActiveTab} />
      </div>
    </div>
  );
};

export default Index;
