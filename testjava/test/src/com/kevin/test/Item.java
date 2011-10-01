package com.kevin.test;

class Item implements Comparable<Item> {
	@Override
	public int compareTo(Item o) {
		// TODO Auto-generated method stub
		return (this._age - o._age);
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return _name + " " + Integer.toString(_age);
		// return super.toString();
	}

	public Item(String _name, int _age, String _address) {
		super();
		this._name = _name;
		this._age = _age;
		this._address = _address;
	}

	public String get_name() {
		return _name;
	}

	public void set_name(String _name) {
		this._name = _name;
	}

	public int get_age() {
		return _age;
	}

	public void set_age(int _age) {
		this._age = _age;
	}

	public String get_address() {
		return _address;
	}

	public void set_address(String _address) {
		this._address = _address;
	}

	private String _name;
	private int _age;
	private String _address;
}