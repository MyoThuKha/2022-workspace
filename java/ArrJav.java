package codecamp;

import java.util.Arrays;
public class ArrJav {
    public static void main(String[] args) {
        //Cause array is reference type.
        //4 is the length of array
        int[] numbers = new int[4];
        numbers[0] = 8;
        numbers[1] = 2;
        numbers[2] = 7;
        numbers[3] = 1;
        
        System.out.println(numbers.length);
        Arrays.sort(numbers);
        System.out.println(Arrays.toString(numbers));
    }
}
