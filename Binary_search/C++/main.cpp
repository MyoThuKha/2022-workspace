#include <iostream>

int binarySearch(int argArr[],int start,int end,int argFind)
{
    if (end >= 1)
    {
        int mid = (start + end)/2;

        if (argFind == argArr[mid])
        {
            return mid;
        }

        if(argFind < argArr[mid])
        {
            return binarySearch(argArr,start,mid-1,argFind);
        }
        return binarySearch(argArr,mid,end,argFind);
    }
    //Don't forget return something if end < 1
    //i will return -1 cause the function is int return type.
    return -1;
}

int main(void)
{
    int array[] = {1,2,3,4,5,6,7};
    int findWord = 6;

    int arr_len = sizeof(array)/sizeof(array[0]);
    int result = binarySearch(array,0,arr_len,findWord);

    
    if (result == -1)
    {
        std::cout << "Empty list" << std::endl;
    }
    else
    {
        std::cout << "Found in index at " << result << std::endl;
    }
    return 0;
}

