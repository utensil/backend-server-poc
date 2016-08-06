#include "gtest/gtest.h"
#include "dummy/dummy.h"

TEST(DummyTest, testDummy)
{
  Dummy* pDummy = new Dummy();
  EXPECT_TRUE(nullptr != pDummy);
  delete pDummy;
}
