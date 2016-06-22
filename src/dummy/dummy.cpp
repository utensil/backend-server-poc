#include "dummy/dummy.h"

#include <iostream>

Dummy::Dummy()
{
  std::cout << "Constructing Dummy..." << std::endl;
}

Dummy::~Dummy()
{
  std::cout << "Destructing Dummy..." << std::endl;
}
