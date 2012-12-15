package com.grazestar.kevin;

class Apple extends Frute{
	/**
	 * @return String to caller.
	 */
	public String toString() {
		return Name;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		this.Color = color;
	}
	private int Age;
	private String Name;
	private String Color;
	
	/**
	 * Test method
	 */
	@Override
	void test() {
		System.out.println("Override test()");
		
	}
}
