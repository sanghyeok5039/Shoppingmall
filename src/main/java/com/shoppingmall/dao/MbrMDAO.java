package com.shoppingmall.dao;

import java.util.ArrayList;

public interface MbrMDAO {
	
	ArrayList<String> mbrMulSrch();
	ArrayList<String> nameSrch(String word);
	ArrayList<String> idSrch(String word);
	ArrayList<String> telSrch(String word);
	
}
