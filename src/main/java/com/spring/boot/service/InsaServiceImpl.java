package com.spring.boot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.boot.VO.InsaVO;
import com.spring.boot.VO.SearchVO;
import com.spring.boot.mapper.InsaMapper;

@Service  //InsaServiceImpl 객채생성
public  class InsaServiceImpl implements InsaService{




	@Autowired  //insaMapper에 있는 sql문을 InsaServiceImpl로 읽어와서 의존성주입하여 객체생성 한것.
	private InsaMapper insaMapper;

	@Override //created
	public void insertData(InsaVO vo) throws Exception{
		insaMapper.insertData(vo);
	}

	@Override //id체크
	public boolean idCheck(InsaVO vo) throws Exception {
		int idCount = insaMapper.idCheck(vo);
		return 0 < idCount;
	}


	@Override //검색 및 페이징
	public Map<String, Object> insaList(String pageNum, SearchVO search) throws Exception {

		int PAGE_SIZE = 8;
		int PAGE_GROUP = 10;
		System.out.println("임플리먼트 넘어와썸!1111111");

		int currentPage= Integer.parseInt(pageNum);

		if(currentPage < 1) {
			currentPage = 1;
		}

		boolean searchOption =(search.getS_sabun() != 0 || search.getS_name() != "" || 
				search.getS_join_gbn()!= "" || search.getS_put_yn()!= "" || 
				search.getS_pos_gbn() != "" || search.getS_job_type() != "" || 
				search.getS_join_day() != "" || search.getS_retire_day() != "" ) ? true : false;

		int startRow = currentPage * PAGE_SIZE - (PAGE_SIZE - 1);
		int endRow = startRow + PAGE_SIZE - 1;

		System.out.println(search.getS_join_day());
		System.out.println(search.getS_retire_day());


		int listCnt = insaMapper.insaCnt(search);


		int pageCount = listCnt / PAGE_SIZE + (listCnt % PAGE_SIZE == 0 ? 0 : 1);

		int startPage = ((currentPage - 1) / PAGE_GROUP) * PAGE_GROUP + 1;

		int endPage = startPage + PAGE_GROUP - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}

		System.out.println("임플리먼트 넘어와썸!222222222");

		Map<String, Object> insaMap = new HashMap<String, Object>();
		insaMap.put("startRow", startRow);
		insaMap.put("endRow", endRow);
		insaMap.put("s_sabun", search.getS_sabun());
		insaMap.put("s_name", search.getS_name());
		insaMap.put("s_join_gbn", search.getS_join_gbn());
		insaMap.put("s_put_yn", search.getS_put_yn());
		insaMap.put("s_pos_gbn", search.getS_pos_gbn());
		insaMap.put("s_join_day", search.getS_join_day());
		insaMap.put("s_retire_day", search.getS_retire_day());
		insaMap.put("s_job_type", search.getS_job_type());

		List<InsaVO> insaList = insaMapper.insaList(insaMap);	


		Map<String, Object> modelMap = new HashMap<String, Object>();

		modelMap.put("insaList", insaList);
		modelMap.put("pageCount", pageCount);
		modelMap.put("startPage", startPage);
		modelMap.put("endPage", endPage);
		modelMap.put("currentPage", currentPage);
		modelMap.put("listCnt", listCnt);
		modelMap.put("pageGroup", PAGE_GROUP);
		modelMap.put("searchOption", searchOption);

		if(searchOption == true) modelMap.put("search", search);



		System.out.println("임플리먼트 넘어와썸!3333333");
		return modelMap;

	}


	//삭제
	@Override
	public void deleteInsa(int[] sabun) throws Exception {
		insaMapper.deleteInsa(sabun);
	}


	@Override //공통코드
	public Map<String,Object> commonCode() throws Exception{

		//맵 만들기
		Map<String, Object> common = new HashMap<String, Object>();

		//맵에 넣기
		common.put("join", insaMapper.join());
		common.put("sex", insaMapper.sex());
		common.put("pos", insaMapper.pos());
		common.put("dept", insaMapper.dept());
		common.put("jobType", insaMapper.jobType());
		common.put("putYn", insaMapper.putYn());
		common.put("gartLevel", insaMapper.gartLevel());
		common.put("milYn", insaMapper.milYn());
		common.put("milType", insaMapper.milType());
		common.put("milLevel", insaMapper.milLevel());
		common.put("kosaRegYn", insaMapper.kosaRegYn());
		common.put("kosaClassCode", insaMapper.kosaClassCode());

		return common;
	}



	@Override
	public int insaCnt(SearchVO search) throws Exception {
		return 0;
	}


	//업데이트를 위한 인사리스트 호출
	@Override
	public InsaVO getInsa(int sabun)  throws Exception{
		return insaMapper.getInsa(sabun);
	}

	//업데이트
	@Override
	public void updatedInsa(InsaVO vo)  throws Exception {		
		
		System.out.println("헤이~");
		
		insaMapper.updatedInsa(vo);
	}



	//파일업로드

	@Override public String getProfile(int sabun) throws Exception {
		return insaMapper.getProfile(sabun);
	}


	@Override public String getCmp_reg_image(int sabun) throws Exception {
		return insaMapper.getCmp_reg_image(sabun);
	}

	@Override public String getCarrier(int sabun) throws Exception { 
		return insaMapper.getCarrier(sabun);
	}


}
