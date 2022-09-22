package com.spring.boot.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.spring.boot.VO.InsaComVO;
import com.spring.boot.VO.InsaVO;
import com.spring.boot.VO.SearchVO;

@Mapper
public interface InsaMapper {

	//created
	public void insertData(InsaVO vo) throws Exception;

	//id체크
	public int  idCheck(InsaVO vo) throws Exception;	

	//리스트 & 검색
	public  List<InsaVO> insaList(Map<String,Object> insaMap) throws Exception;
	public int insaCnt(SearchVO search)  throws Exception;

	//삭제
	public  void deleteInsa(int[] sabun) throws Exception;

	//업데이트
	public InsaVO getInsa(int sabun) throws Exception;
	public void updatedInsa(InsaVO vo) throws Exception;

	public String getProfile(int sabun) throws Exception; 
	public String getCmp_reg_image(int sabun) throws Exception;
	public String getCarrier(int sabun) throws Exception;



	//공통코드
	public List<InsaComVO> join() throws Exception;
	public List<InsaComVO> sex() throws Exception;
	public List<InsaComVO> pos() throws Exception;
	public List<InsaComVO> dept() throws Exception;
	public List<InsaComVO> jobType() throws Exception;
	public List<InsaComVO> putYn() throws Exception;
	public List<InsaComVO> gartLevel() throws Exception;
	public List<InsaComVO> milYn() throws Exception;
	public List<InsaComVO> milType() throws Exception;
	public List<InsaComVO> milLevel() throws Exception;
	public List<InsaComVO> kosaRegYn() throws Exception;
	public List<InsaComVO> kosaClassCode() throws Exception;








}
