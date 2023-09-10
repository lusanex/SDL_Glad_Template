#include <SDL2/SDL.h>
#include <gtest/gtest.h>
#include <glad/glad.h>

TEST(DummyTest, SDLInitTest) {
    EXPECT_EQ(SDL_Init(SDL_INIT_VIDEO), 0);
    SDL_Quit();
}

TEST(DummyTest, AlwaysPasses) {
    EXPECT_EQ(1, 1);
}

TEST(DummyTest, AnotherTest) {
    EXPECT_TRUE(true);
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
