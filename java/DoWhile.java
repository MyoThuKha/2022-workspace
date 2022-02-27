import java.util.Scanner;

public class DoWhile {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String input = "";
        do {
            System.out.print("Enter: ");
            input = scan.nextLine().trim();
            if (input.equals("Apple pie")){
                    System.out.println("Correct");
                    break;
            }
        } while (!input.equals("quit"));
    }
}

