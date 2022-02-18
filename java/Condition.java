public class Condition {
    public static void main(String[] args) {
        int score = 83;
        
        //Single statement condition doesn't need {}.
        if (score > 80) {
            System.out.println("Honor");
            System.out.println("pass");
        }
        else if (score > 40)
            System.out.println("pass");
        else
            System.out.println("Fail");
    }
}
