package com.test;

import java.util.Random;

public class Test {
	public static void main(String[] args) {
		String[] COLORS={"red","green","blue"};
		for(int i=0;i<20;i++)
		System.out.println(new Random().nextInt(3)+1);
	}
}
