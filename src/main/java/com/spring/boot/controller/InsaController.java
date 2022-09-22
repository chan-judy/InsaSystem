package com.spring.boot.controller;

import java.io.File;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.boot.VO.InsaVO;
import com.spring.boot.VO.SearchVO;
import com.spring.boot.service.InsaService;

@Controller 
public class InsaController {

	@Resource
	private InsaService insaService; //얘를 호출하면 insaServiceImpl이 딸려들어옴

	private final static String DEFAULT_PATH = "upload\\";


	//인덱스 화면
	@RequestMapping(value = "/index.do")
	public ModelAndView index() throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index"); //jsp(html)로 갈때는 setViewName // class로 갈때는 setView
		return mav;
	}

	//created 창(공통코드 포함쓰)
	@RequestMapping(value = "/created.action", method = {RequestMethod.GET,RequestMethod.POST}) 
	public ModelAndView created() throws	Exception{

		Map<String, Object> insaComMap = insaService.commonCode();
		ModelAndView mav = new ModelAndView();

		mav.addObject("common",insaComMap);
		mav.setViewName("insa/created");
		return mav;
	};

	//아이디 중복체크!
	@RequestMapping
	(value = "/idCheck.do")
	@ResponseBody
	public boolean idCheck(@RequestParam("id") String id, InsaVO vo) throws Exception{

		return insaService.idCheck(vo);
	};
	
	
	//입력한 값 DB로 Input _ 파일업로드와 인풋 동시에 진행
	@RequestMapping(value = "/created_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView created_ok(
			InsaVO vo,HttpServletRequest req, 
			@RequestParam(value = "profile1" , required = false)MultipartFile profile,
			@RequestParam(value = "cmp_reg_image1" , required = false)MultipartFile cmp_reg_image,
			@RequestParam(value = "carrier1" , required = false)MultipartFile carrier
			) throws Exception {
		
		System.out.println("=========write_ok=========");
	
		
		//file 자료 제대로 insert 됐는지 확인
		System.out.println(profile); 
		System.out.println(cmp_reg_image); 
		System.out.println(carrier); 
		  
		// 객체생성  
		ModelAndView mav = new ModelAndView();


		//파일업로드 검증
		try {
		if(!profile.isEmpty()){
			
			//이름만들자
			String pName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());
			
			//오리진 파일 받아오고
			String pOrigin = profile.getOriginalFilename();
			System.out.println("1 origin : " + pOrigin);
			
			//오리진 파일에서 확장자만 추출하고
			String pExe = pOrigin.substring(pOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + pExe);
			
			//(업로드 경로, 새로운 이름), 만약에 없으면 만들어라
			File pSave = new File(DEFAULT_PATH + pName + "." + pExe);
			System.out.println("4. 업로드 경로와 최종파일 이름" + pSave);	
//			if(!pSave.exists()) {
//				pSave.mkdirs();
//			}
			
			profile.transferTo(pSave);
			vo.setProfile(pName + "." + pExe);

			
		}
		//같은코드
		if(!cmp_reg_image.isEmpty()){
			
			String cmName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());
			
			String cmOrigin = cmp_reg_image.getOriginalFilename();
			System.out.println("1 origin : " + cmOrigin);
			
			String cmExe = cmOrigin.substring(cmOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + cmExe);
			
			File cmSave = new File(DEFAULT_PATH + cmName  + "." + cmExe);
			System.out.println("4. 업로드 경로와 최종파일 이름" + cmSave);	
//			if(!cmSave.exists()) {
//				cmSave.mkdirs();
//			}
			
			cmp_reg_image.transferTo(cmSave);
			vo.setCmp_reg_image(cmName + "." + cmExe);
 
			
		}
		
		if(!carrier.isEmpty()){
					
			String caName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());

			String caOrigin = carrier.getOriginalFilename();
			System.out.println("1 origin : " +caOrigin);
					
			String caExe = caOrigin.substring(caOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + caExe);
					
			File caSave = new File(DEFAULT_PATH + caName  + "." + caExe);
			System.out.println("4. 업로드 경로와 최종파일 이름 :" + caSave);	
//			if(!caSave.exists()) {
//				caSave.mkdirs();
//			}
					
			carrier.transferTo(caSave);
			vo.setCarrier(caName + "." + caExe);
			
			}
		 	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		insaService.insertData(vo);
		mav.setViewName("redirect:/search.action");
		
		return mav;
	}
	
	
	//검색&리스트 페이지 
	@RequestMapping(value = "/search.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView search
	(SearchVO search, boolean searchOption,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") String pageNum) throws Exception{

		Map<String, Object> insaComMap = insaService.commonCode(); //공통코드 호출

		ModelAndView mav = new ModelAndView();
		mav.addObject("common",insaComMap);
		mav.addObject("search", search);
		mav.addObject("searchOption", searchOption);
		mav.addObject("pageNum", pageNum);
		mav.setViewName("insa/search"); 
		System.out.println("컨트롤러 넘어와썸!1111111");
		return mav;
	};


	//검색
	@ResponseBody
	@GetMapping(value = "/searchForm.action")		//얘는 메소드 기본으로 get임. post안됨!
	public Map<String, Object> searchForm(SearchVO search, Model model,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") String pageNum) throws Exception {

		Map<String, Object> map = insaService.insaList(pageNum, search);
		System.out.println("컨트롤러 넘어와썸!222222222");

		return map;
	}


	//삭제
	@RequestMapping("/delete.action")
	@ResponseBody
	public void delete(int[] sabun) throws Exception {
		insaService.deleteInsa(sabun);
	}



	//업데이트
	@RequestMapping(value = "/updatedForm.action", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updatedForm(Model model, int sabun, SearchVO search,
			@RequestParam(value = "pageNum", required = false, defaultValue = "1") String pageNum) throws Exception {

		System.out.println("업데이트가보자구");

		boolean searchOption =(search.getS_sabun() != 0 || search.getS_name() != "" || 
				search.getS_join_gbn()!= "" || search.getS_put_yn()!= "" || 
				search.getS_pos_gbn() != "" || search.getS_job_type() != "" || 
				search.getS_join_day() != "" || search.getS_retire_day() != "" ) ? true : false;

		System.out.println("야호!!!!");

		Map<String, Object> insaComMap = insaService.commonCode();

		InsaVO insa = insaService.getInsa(sabun);

		ModelAndView mav = new ModelAndView();

		mav.addObject("common",insaComMap);
		mav.addObject("search", search);
		mav.addObject("insa", insa);
		mav.addObject("pageNum", pageNum);
		mav.addObject("sabun", sabun);
		mav.addObject("searchOption", searchOption);


		insaService.updatedInsa(insa);
		mav.setViewName("insa/update"); 

		System.out.println("왔어?");
		return mav;
	}
	
	@RequestMapping(value = "/updated_ok.action", method = RequestMethod.POST)
	public ModelAndView updated_ok(
			InsaVO vo,HttpServletRequest req, 
			@RequestParam(value = "profile1" , required = false)MultipartFile profile,
			@RequestParam(value = "cmp_reg_image1" , required = false)MultipartFile cmp_reg_img,
			@RequestParam(value = "carrier1" , required = false)MultipartFile carrier
			) throws Exception {
		
		System.out.println("=========updated_ok=========");
	
		
		//file 자료 제대로 insert 됐는지 확인
		System.out.println(profile); 
		System.out.println(cmp_reg_img); 
		System.out.println(carrier); 
		  
		// 객체생성  
		ModelAndView mav = new ModelAndView();


		//파일업로드 검증
		try {
		if(!profile.isEmpty()){
			
			//이름만들자
			String pName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());
			
			//오리진 파일 받아오고
			String pOrigin = profile.getOriginalFilename();
			System.out.println("1 origin : " + pOrigin);
			
			//오리진 파일에서 확장자만 추출하고
			String pExe = pOrigin.substring(pOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + pExe);
			
			//(업로드 경로, 새로운 이름), 만약에 없으면 만들어라
			File pSave = new File(DEFAULT_PATH + pName + "." + pExe);
			System.out.println("4. 업로드 경로와 최종파일 이름" + pSave);	
//			if(!pSave.exists()) {
//				pSave.mkdirs();
//			}
			
			profile.transferTo(pSave);
			vo.setProfile(pName + "." + pExe);

			
		}
		//같은코드
		if(!cmp_reg_img.isEmpty()){
			
			String cmName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());
			
			String cmOrigin = cmp_reg_img.getOriginalFilename();
			System.out.println("1 origin : " + cmOrigin);
			
			String cmExe = cmOrigin.substring(cmOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + cmExe);
			
			File cmSave = new File(DEFAULT_PATH + cmName  + "." + cmExe);
			System.out.println("4. 업로드 경로와 최종파일 이름" + cmSave);	
//			if(!cmSave.exists()) {
//				cmSave.mkdirs();
//			}
			
			cmp_reg_img.transferTo(cmSave);
			vo.setCmp_reg_image(cmName + "." + cmExe);
 
			
		}
		
		if(!carrier.isEmpty()){
					
			String caName = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt());

			String caOrigin = carrier.getOriginalFilename();
			System.out.println("1 origin : " +caOrigin);
					
			String caExe = caOrigin.substring(caOrigin.lastIndexOf(".")+1);
			System.out.println("2. 확장자 : " + caExe);
					
			File caSave = new File(DEFAULT_PATH + caName  + "." + caExe);
			System.out.println("4. 업로드 경로와 최종파일 이름 :" + caSave);	
//			if(!caSave.exists()) {
//				caSave.mkdirs();
//			}
					
			carrier.transferTo(caSave);
			vo.setCarrier(caName + "." + caExe);
			}
		 	
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		System.out.println("up_ok");
		System.out.println(vo.getSabun());
		
		
		
		insaService.updatedInsa(vo);
		mav.setViewName("redirect:/search.action");
		
		return mav;
	}
	
	
	
	
	
};