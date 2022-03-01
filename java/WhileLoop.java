import java.util.Scanner;

public class WhileLoop {
    public static void main(String[] args) {
        String rightAns = "Apple Pie";
        Scanner scan = new Scanner(System.in);
        String userInput = "";

        while (!userInput.equals("quit")) {
            System.out.print("Enter guess: ");
            userInput = scan.nextLine().trim();

            if (userInput.equals(rightAns)) {
                System.out.println("You win");
                break;
            }
            else if (userInput.equals("quit"))
                break;
            else
                System.out.println("Guess Again");
        }
    }
}
