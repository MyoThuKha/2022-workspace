def palin(word):
    if len(word) < 2: 
        return True
    if word[0] != word[-1]: 
        return False
    return palin(word[1:-1])

arr = ['hello','world','racecar','charger','coffee','madam']

print(palin(arr))
