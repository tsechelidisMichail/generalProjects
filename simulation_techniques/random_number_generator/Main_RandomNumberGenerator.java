package main;

import java.math.BigDecimal;
import java.math.BigInteger;

public class Main {
	private static BigInteger a;
	private static BigInteger c;
	private static BigInteger mod;
	private static double deviation = 0;
	private static double median = 0;
	private static int[] runs;
	private static int[] areas;
	
	public static void main(String[] args) {
		
		//initiate the generator with the required numbers
		a=  BigInteger.valueOf(1664525);
		c= BigInteger.valueOf(1013904223);
		mod = BigInteger.TWO.pow(32);
		
		
		// create 1000000 numbers and areas test accuracy with 10(0.1)
		generateNumbers(1000000,10);
		printResults();
	}
	
	public static void generateNumbers(int numberCount, int area_division) {
		
		//Use of library in JAVA
		//The seed, previous = 0
		BigInteger current;
		BigInteger previous = BigInteger.valueOf(0);
		
		
		//The rest of variables needed
		double deviationMedian = 0.5;
		double randomTotal = 0;
		double variance = 0;
		double randomNumber = 0;
		int counter = 0;
		boolean top = true;
		runs = new int[numberCount+1];
		areas = new int[area_division];
		
		
		//Loop for how many numbers you want
		for(int i =0; i< numberCount ; i++) {
			
			
			//This is linear-same_remainder
			current = a.multiply(previous);
			current = current.add(c);
			current = current.mod(mod);
			
			
			//This is current random number
			BigDecimal decimal = BigDecimal.valueOf(current.longValue());
			decimal = decimal.divide(BigDecimal.valueOf(mod.longValue()));
			randomNumber = decimal.doubleValue();
			
			
			//Increase total for median
			randomTotal += randomNumber;
			
			
			//Calculate variance
			double distance = randomNumber - deviationMedian;
			variance += Math.pow(distance, 2);
			
			
			//Runns Test
			if(randomNumber > deviationMedian && !top) {
				top = true;
				runs[counter]++;
				counter =0 ;
			}else if(randomNumber < deviationMedian && top) {
				top = false;
				runs[counter]++;
				counter =0 ;
			}
			counter++;
			
			
			//Areas Test
			double temp = randomNumber*area_division;
			int area =(int) temp;
			areas[area]++;
			
			System.out.println("Current Z : " + current);
			System.out.println("Current random number: " + randomNumber + ". AREA[" + area + "]");
			System.out.println("Current distance: " + distance);
			System.out.println("Current variancee: " + variance);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			
			//Next iteration
			previous = current;
		}
		
		
		//At the end
		
		
		//this is needed to save the last run of Runns since it may not have changed region for
		//it to be saved.
		runs[counter]++;
		
		deviation = Math.sqrt(variance/ numberCount);
		median = randomTotal / numberCount;
	}
	
	public static void printResults() {
		System.out.println("===>Median is: " + median);
		System.out.println("!!!>Standar deviation is: " + deviation);
		System.out.println("#############RUNNS TEST##############");
		for(int i = 0; i< runs.length ; i++) {
			if(runs[i]!=0) {
				System.out.println("Distance: " + i + ".->Counter: " + runs[i] + ".");
			}
		}
		System.out.println("%%%%%%%%%%%%%%AREAS TEST%%%%%%%%%%%%%%%%%%%%");
		for(int i = 0; i< areas.length ; i++) {
			if(areas[i]!=0) {
				System.out.println("Area: " + i + ".->Counter: " + areas[i] + ".");
			}
		}
		
	}
	
}
