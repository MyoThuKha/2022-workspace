#include <iostream>

bool ispalin(std::string argWord)
{
    if (argWord.length() < 2){
        return true;
    }
    if (argWord[0] != argWord[-1]){
        return false;
    }
 
    return ispalin(argWord[1,-1]);
}
int main(void)
{
    std::string word = "racecar";
    ispalin(word);
    return 0;
}
