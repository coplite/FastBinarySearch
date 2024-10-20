#include <iostream>
#include <algorithm>

extern "C" int BinarySearch(int*, int, int);

int main()
{
    int array[] = {1, 2, 3, 5, 8, 13, 21, 34, 55, 89};                     // any rando sorted array  
    std::sort(array, array + sizeof(array)/sizeof(int));                   // sorting stuff i might dont not need
    std::cout << "sizeof array: " << sizeof(array)/sizeof(int) << "\n";
    int rest = BinarySearch(array, (sizeof(array)/sizeof(int)), 89);       // BinarySearch(int* array, int size, int element);
    if(rest != -1)
    {
        std::cout << "index of given element: " << rest << "\n";
    }
    else
    {
        std::cout << "Element not found!!!\n";
    }
}
