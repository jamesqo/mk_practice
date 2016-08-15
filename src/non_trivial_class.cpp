#include "non_trivial_class.h"

#include <iostream>

// Adding a comment here to test make

non_trivial_class::non_trivial_class()
{
    std::cout << "A non_trivial_class object is being created." << std::endl;
}

non_trivial_class::~non_trivial_class()
{
    std::cout << "A non_trivial_class object is being destroyed." << std::endl;
}
