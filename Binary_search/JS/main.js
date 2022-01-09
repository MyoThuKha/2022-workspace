function binarySearch(arr,start,end,findWord){
    if (end >= 1)
    {
        var mid = (start + end-1)/2;
        if (arr[mid] == findWord){
            return mid;
        }
        if (mid < arr[mid]){
            return binarySearch(arr,start,mid,findWord);
        }
        return binarySearch(arr,mid,end,findWord);
    }
    return -1;
}

var array = [1,2,3,4,5,6,7,8];
var findWord = 6;

var result = binarySearch(array,0,array.length,findWord);

if (result == -1){
    console.log("Array has no element");
}
else{
    console.log("Found in index at", result);
}
