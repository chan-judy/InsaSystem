package com.spring.boot.service;

import java.util.Map;

import com.spring.boot.VO.InsaVO;
import com.spring.boot.VO.SearchVO;


public interface InsaService {

	//created
	public  void insertData(InsaVO vo) throws Exception;
	
	//id체크
	public boolean idCheck(InsaVO vo) throws Exception;	
	
	//공통코드
	public Map<String, Object> commonCode() throws Exception;
	
	
	//검색 & 리스트
	public  Map<String, Object> insaList(String pageNum, SearchVO search) throws Exception;
	public int  insaCnt(SearchVO search) throws Exception;
	
	
	//삭제
	public  void deleteInsa(int[] sabun) throws Exception;

	//업데이트
	public  InsaVO  getInsa(int sabun)  throws Exception;
	public  void updatedInsa(InsaVO vo) throws Exception;
	
	  public String getProfile(int sabun) throws Exception;
	  public String getCmp_reg_image(int sabun) throws Exception; 
	  public String getCarrier(int sabun) throws Exception;
	  
	  
	 
	
	
}
	
	