
#include "gtest/gtest.h"

#include <imgui.h>

TEST(BasicTest, BasicTest) {
    EXPECT_NE(IMGUI_VERSION, "0");
}