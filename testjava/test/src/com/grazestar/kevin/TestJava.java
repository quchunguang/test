package com.grazestar.kevin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class TestJava {

	enum Spiciness {
		YES, NO, OK, CANCLE
	}

	private static final int CONST_ONE = 1;
	private static final int CONST_TWO = 2;
	private static final int CONST_THREE = 3;
	private static List<Integer> list;
	private static Frute frute;

	/**
	 * Main method.
	 * 
	 * @param args
	 *            Input arguments
	 */
	public static void main(String[] args) {
		createlist();
		createapple();
		output(1);

		Random rand = new Random();
		int[] a = { 1, 2, 3 };
		int[] b = a;
		int[] c = new int[rand.nextInt(20)];
		System.out.println(Arrays.toString(a));
		System.out.println(Arrays.toString(b));
		System.out.println(Arrays.toString(c));
		Spiciness s = Spiciness.YES;
		s = Spiciness.NO;
		System.out.println(s);
		for (Spiciness sp : Spiciness.values())
			System.out.print(sp.name() + " ");
	}

	private static void createapple() {
		Apple apple = new Apple();
		apple.setName("Fujie");
		apple.setColor("Red");
		apple.setAge(1);
		frute = apple;
	}

	/**
	 * Create integer list.
	 */
	private static void createlist() {
		list = new ArrayList<Integer>();
		list.add(CONST_ONE);
		list.add(CONST_TWO);
		list.add(CONST_THREE);
	}

	/**
	 * Outout to stdout
	 * @param i
	 */
	private static void output(int i) {
		System.out.println("Hello World!\n");
		System.out.println(list.get(2));
		frute.test();
		System.out.println("END.");
	}

}
