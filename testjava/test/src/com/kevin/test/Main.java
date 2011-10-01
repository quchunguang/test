package com.kevin.test;

import java.util.Collections;
import java.util.LinkedList;

import com.kevin.test.Item;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		int i = 0;
		if (i == 0) {
			LinkedList<Item> list = new LinkedList<Item>();
			Item o = new Item("kevin", 10, "none");
			list.add(o);
			o = new Item("kevin", 30, "none");
			list.add(o);
			o = new Item("say", 50, "none");
			list.add(o);
			o = new Item("sam", 70, "none");
			list.add(o);
			o = new Item("robot", -1, "none");
			list.add(o);

			Collections.shuffle(list);
			Collections.sort(list);
			for (Item item : list) {
				System.out.println(item);
			}
		}
	}
}
