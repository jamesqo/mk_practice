#include "non_trivial_class.h"

#include <iostream>

// Adding a comment here to test make

int main()
{
    std::cout << "This is just some practice with using Makefiles." << std::endl;
    
    {
        non_trivial_class will_do_something_on_destruction;
    }
    
    std::cout << "This is an indication that everything completed successfully." << std::endl;

    return 0;
}
