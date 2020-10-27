package com.shoppingmall.dao;

import com.shoppingmall.dto.MembersDto;

public interface IMembersDao {
	MembersDto search(String mbr_id);
	void pointupdate(MembersDto dto);
	MembersDto searchnon(String ip);
	void insertnon(MembersDto dto);
	int countnon();
}
