public class SwitchState {
    public static void main(String[] args) {
        String role = "admin";
        switch (role) {
            case "admin":
                System.out.println("You are admin");
                break;
            case "moderator":
                System.out.println("You are mod");
                break;
            default:
                System.out.println("You are memember");
        }

    }
}
