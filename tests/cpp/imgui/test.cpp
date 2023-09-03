
#include <imgui.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) { 
    std::string version = IMGUI_VERSION;
    EXPECT_NE(version, "0"); 
}
