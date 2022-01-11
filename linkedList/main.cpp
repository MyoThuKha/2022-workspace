#include <iostream>

class Node
{
    public:
        int value;
        Node *pNext;

};

void printResult (Node *pArg)
{
    do
    {
        std::cout << pArg -> value <<std::endl;
        pArg = pArg -> pNext;
    }
    while (pArg -> pNext != NULL);
}

int main()
{
    Node *pFirst = NULL;
    Node *pSecond = NULL;
    Node *pThird = NULL;

    pFirst = new Node;
    pSecond = new Node;
    pThird = new Node;

    pFirst-> value = 5;
    pFirst->pNext = pSecond;

    pSecond -> value = 2;
    pSecond -> pNext = pThird;

    pThird -> value = 7;
    pThird -> pNext = NULL;

    printResult(pFirst);

    delete pFirst;
    delete pSecond;
    delete pThird;
    return 0;
}
