public class Ternary {
    public static void main(String[] args) {
        int income = 135_000;
        String flightClass = income > 100_000? "Business":"Economy";
        System.out.println(flightClass);
    }
}
