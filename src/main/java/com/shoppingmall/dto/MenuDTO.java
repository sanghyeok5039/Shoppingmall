package com.shoppingmall.dto;

import java.util.ArrayList;

public class MenuDTO {
	private String m_Ctgr_Id;
	private String m_Ctgr_Name;
	private ArrayList<CtgryDTO> ctgryList; 
	public String getM_Ctgr_Name() {
		return m_Ctgr_Name;
	}
	public void setM_Ctgr_Name(String m_Ctgr_Name) {
		this.m_Ctgr_Name = m_Ctgr_Name;
	}
	public String getM_Ctgr_Id() {
		return m_Ctgr_Id;
	}
	public void setM_Ctgr_Id(String m_Ctgr_Id) {
		this.m_Ctgr_Id = m_Ctgr_Id;
	}
	public ArrayList<CtgryDTO> getCtgryList() {
		return ctgryList;
	}
	public void setCtgryList(ArrayList<CtgryDTO> ctgryList) {
		this.ctgryList = ctgryList;
	}
}
