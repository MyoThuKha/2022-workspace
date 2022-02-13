import java.util.Arrays;
public class DimensionalArray {
    public static void main(String [] args) {
        int[][] matrix = new int[2][3];
        matrix[0][1] = 6;
        //Use deepToString for two dimensional array.
        System.out.println(Arrays.deepToString(matrix));
        
        //Another way to create array.
        int [][] matrix2 = {{1,2,3},{4,5,6}};
        System.out.println(Arrays.deepToString(matrix2));
    }
}
