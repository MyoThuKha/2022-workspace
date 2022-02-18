public class Condition {
    public static void main(String[] args) {
        int score = 83;
        
        //Single statement condition doesn't need {} 
        // can't declare variable in if. cause outside {} guys can't access it.
        //so declare variable outside if scope.

        if (score > 80) {
            System.out.println("Honor");
            System.out.println("pass");
        }
        else if (score > 40)
            System.out.println("pass");
        else
            System.out.println("Fail");
        
        //Simplify
        boolean isPerfect = (score == 100);
        System.out.println(isPerfect);
        
    }
}
