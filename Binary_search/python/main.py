def binarySearch(arr, start, end, find):
    if end >1:
        # //(integer division operator) means divide and keeps the whole number
        mid = start + end //2
        if (find == arr[mid]):
            return mid
        if (find < arr[mid]):
            return binarySearch(arr,start,mid,find)
        return binarySearch(arr,mid,end,find)

arr = [1,2,3,4,5,6,7]
find_word = 4
result = binarySearch(arr, 0, len(arr), find_word)
print("Found in index at",result)

