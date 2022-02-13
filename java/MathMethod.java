public class MathMethod {
    public static void main(String[] args) {
        System.out.println("Max - "+Math.max(334, 343));
        System.out.println(Math.min(334, 343));
        
        System.out.println(Math.round(34.63));
        System.out.println(Math.ceil(45.34));
        System.out.println(Math.floor(45.34));

        System.out.println(Math.random());
        System.out.println(Math.random()*100);
        //This will cast the result between 0 and 1 so the result will always 0.
        System.out.println((int)Math.random() *100);
        
        System.out.println(Math.round(Math.random()*100));
        //has to typecast cause Math.round return long and can't implicit long to int.
        int randomInt = (int)Math.round(Math.random()*100);
        System.out.println(randomInt);

    }
}
