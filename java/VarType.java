public class VarType {
	public static void main(String[] args) {
		//Camel naming convention
		byte myAge = 23;
		byte herAge = myAge;

		boolean isMale = true;
		int id = 334_383;
		//long and float
		long count = 3_444_634_343L;
		float decimal = 4.44F;
		double deciLong =454.343;
		
		//constant (Uppercase naming)
		final float PI = 3.14F;
		System.out.println("My age is "+myAge);
		System.out.println("Her age is "+herAge);
	}
}
