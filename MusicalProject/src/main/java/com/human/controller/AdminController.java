package com.human.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.human.dto.ActorCharacterDto;
import com.human.dto.ActorDto;
import com.human.dto.AdminDto;
import com.human.dto.AuthoritiesDto;
import com.human.dto.CharacterDto;
import com.human.dto.CustomerDto;
import com.human.dto.HallDto;
import com.human.dto.MusicalDto;
import com.human.dto.QaDto;
import com.human.dto.ReviewDto;
import com.human.dto.VenueDto;
import com.human.dto.Venue_apiDto;
import com.human.service.IAdminService;
import com.human.service.IAuthoritiesService;
import com.human.service.ICharacterService;
import com.human.service.ICustomerService;
import com.human.service.IHallService;
import com.human.service.IMusicalScheduleService;
import com.human.service.IMusicalService;
import com.human.service.IQaService;
import com.human.service.IReservationService;
import com.human.service.IReviewService;
import com.human.service.ISeatService;
import com.human.service.IVenueService;
import com.human.service.ExcelService;
import com.human.service.IActorCharacterService;
import com.human.service.IActorService;
import com.human.service.IVenue_apiService;
import com.human.vo.BoardVo;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
//	기능설명 : 뮤지컬,배우,극장,홀 - 추가,수정, 삭제
//			리뷰 - 삭제
//			극장관리에서 각 극장별 홀을 편집할 수 있음
//			배역은 개별 뮤지컬 배역 상세보기 페이지에서 추가,수정,삭제
//			뮤지컬 엑셀파일 다운로드 기능
//			문서함은 팩스로 오는 스캔문서를 모아놓은 곳으로 문서함의 문서를 뮤지컬,극장,배우등 항목에 추가하여 전자 문서화 하는 기능으로
//			요즘 회사들은 종이문서를 없애고 전자문서화를 추진하고 있는 추세여서 기능을 추가하였음
//			아직 저장되지 않은 문서는 스캔문서함(팩스로 오는 문서or직접 스캔하면 저장되는 문서함)에 있고 문서를 등록하면 등록문서함으로 폴더를 옮김
//			tiff파일은 등록하면 자동으로 pdf로 변환됨
//			뮤지컬 등 추가,수정 작업을 할 때 view버튼을 누르고 문서를 참고해 작업을 할 수 있게 설계함
//			여러개의 문서가 등록되면 슬라이드로 넘기면서 볼 수 있음
	@Autowired
	private IQaService qaservice;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private IAdminService service;
	
	@Autowired
	private IVenue_apiService venue_apiservice;
	
	@Autowired
	private IReviewService rService;
	
	@Autowired
	private IMusicalService musicalService;
	
	@Autowired
	private IHallService hallservice;
	@Autowired
	private IVenueService venueservice;
	@Autowired
	private IActorCharacterService acService;
	@Autowired
	private IActorService actorService;
	
	@Autowired
	private ICharacterService characterService;
	@Autowired
	private IReservationService reservationservice;
	@Autowired
	private ISeatService seatservice;
	@Autowired
	private IMusicalScheduleService mu_schservice;
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IAuthoritiesService authoritiesService;
		
	public String posterUploadPath() throws UnsupportedEncodingException {
		String severPath = servletContext.getRealPath("/");
		String parentparentPath = new File(severPath).getParent();
		String parentPath = new File(parentparentPath).getParent();
		String uploadsDir = "C:\\Users\\TJ-BU-702-P14\\git\\Musical\\MusicalProject\\src\\main\\webapp\\resources\\img\\musical"; //톰캣서버 기본 경로로 포스터 업로드 경로 설정, 이곳에 저장해야 src로 불러올때 편하다.
		File uploadDir = new File(uploadsDir);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    String uploadPath = URLDecoder.decode(uploadsDir, "UTF-8");
    return uploadPath;
	}
    
	public String actorUploadPath() throws UnsupportedEncodingException {
		String severPath = servletContext.getRealPath("/");
		String parentparentPath = new File(severPath).getParent();
		String parentPath = new File(parentparentPath).getParent();
		String uploadsDir = "C:\\Users\\TJ-BU-702-P14\\git\\Musical\\MusicalProject\\src\\main\\webapp\\resources\\img\\actor"; //톰캣서버 기본 경로로 포스터 업로드 경로 설정
		File uploadDir = new File(uploadsDir);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
    String uploadPath = URLDecoder.decode(uploadsDir, "UTF-8");
    return uploadPath;
	}
	
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String admin_main(BoardVo vo, Model model) throws Exception {
		vo.setPerPageNum(5);
		List<QaDto> searchList = qaservice.qa_listSearch(vo);
		model.addAttribute("list", searchList);
		List<AdminDto> asearchList = service.admin_listSearch(vo);
		model.addAttribute("alist", asearchList);
		return "admin/admin";
	}
	
	@RequestMapping(value = "/admin_admin", method = RequestMethod.GET)
	public String admin_admin(BoardVo vo, Model model) throws Exception {
		List<AdminDto> searchList = service.admin_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(service.admin_listSearchCount(vo));
		return "admin/admin_admin";
	}
	
	
	
	@RequestMapping(value = "/qa_admin", method = RequestMethod.GET)
	public String qa_admin(BoardVo vo, Model model) throws Exception {
		List<QaDto> searchList = qaservice.qa_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(qaservice.qa_listSearchCount(vo));
		return "admin/qa_admin";
	}	
			
	
	@RequestMapping(value = "/res_register", method = RequestMethod.POST)
	@ResponseBody
	public String res_register(@RequestParam("qa_id") int qa_id,
	     @RequestParam("response_input") String response) throws Exception {	    
	    int display=1;
	    qaservice.res_update(qa_id,response,display);   	    
	    return "success";  
	}
	
	@RequestMapping(value = "/res_remove", method = RequestMethod.POST)
	@ResponseBody
	public String res_remove(@RequestParam("qa_id") int qa_id) throws Exception {
	    System.out.println(qa_id);
	    int display=0;
	    qaservice.res_update(qa_id,null,display);   	    
	    return "success";  
	}
	
	@RequestMapping(value = "/admin_musical", method = RequestMethod.GET)
	public String admin_musical(BoardVo vo, Model model) throws Exception {
		List<MusicalDto> searchList = musicalService.musical_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(musicalService.musical_listSearchCount(vo));
		return "admin/admin_musical";
	}
	
	@RequestMapping(value = "/musical_register", method = RequestMethod.GET)
	public String musical_register_file() throws Exception {		
		
		return "admin/musical_register";
	}
	
	@RequestMapping(value = "/musical_register_file", method = RequestMethod.GET)
	public String musical_register_file(@RequestParam("searchType") String searchType,@RequestParam("fileName") String fileName,Model model) throws Exception {		
		if(!fileName.equals(null)) {
			model.addAttribute("searchType",searchType);
			model.addAttribute("fileName",fileName);
		}
		return "admin/musical_register";
	}
	
	@RequestMapping(value = "/musical_register", method = RequestMethod.POST)
	public String musical_registPOST(MusicalDto musical,MultipartFile file,String searchType,String fileName,BoardVo vo ,Model model, RedirectAttributes rttr) throws Exception {
		String savedName=posterUploadFile(file.getOriginalFilename(),file.getBytes());
		musical.setMusical_poster(savedName);
		musicalService.musical_create(musical);
		if(!fileName.equals("")) {
			String table_name="musical";
			String table_crud="doc_create";
			String crud_reason="문서등록";
			List<MusicalDto> searchList=musicalService.musical_listSearch(vo);
			int table_id=searchList.get(0).getMusical_id();
			AdminDto dto=AdminDto.withoutTableContent(table_name,table_id,table_crud,crud_reason,fileName);
			file_register(dto);
			moveFile(fileName, searchType);
		}
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_musical";
	}
	
	
	private String posterUploadFile(String originalFilename, byte[] bytes) throws Exception {
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+originalFilename;
		File target=new File(posterUploadPath(), savedName);
		FileCopyUtils.copy(bytes, target);
		return savedName;
	}
	
	private String actorUploadFile(String originalFilename, byte[] bytes) throws Exception {
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+originalFilename;
		File target=new File(actorUploadPath(), savedName);
		FileCopyUtils.copy(bytes, target);
		return savedName;
	}
	
	@RequestMapping(value = "/musical_remove", method = RequestMethod.GET)
	public String admin_musical_remove(int musical_id, RedirectAttributes rttr,String reason) throws Exception {
		if(reservationservice.reservation_musical_check(musical_id).size()==0) {
			mu_schservice.musical_schedule_Alldelete(musical_id);
			seatservice.seat_Alldelete(musical_id);
			characterService.character_Alldelete(musical_id);
			AdminDto dto=AdminDto.withoutFileName("musical",musical_id,musicalService.musical_read(musical_id).getMusical_title(),"table_delete",reason);
			file_register(dto);
			musicalService.musical_delete(musical_id);			
			rttr.addFlashAttribute("msg", "success");
		}else {
			
			rttr.addFlashAttribute("msg", "fail");
		}
		return "redirect:/admin/admin_musical";
	}
	
	public String file_read(int table_id, String table_name, String table_crud) throws Exception {
		List<AdminDto> dto=service.admin_file_read(table_id,table_name,table_crud);
		String fileName="";
		if(!dto.isEmpty()) {
			if(dto.size()>1) {
				StringBuilder fileNameBuilder = new StringBuilder();
		        
		        // dto 리스트의 모든 fileName을 StringBuilder에 추가
		        for (AdminDto adminDto : dto) {
		            if (adminDto.getFileName() != null) {
		                if (fileNameBuilder.length() > 0) {
		                    fileNameBuilder.append(",");  // 구분자(콤마) 추가
		                }
		                fileNameBuilder.append(adminDto.getFileName());
		            }
		        }
		        
		        // 최종적으로 생성된 문자열을 fileName에 저장
		        fileName = fileNameBuilder.toString();		        
			}else {
				fileName = dto.get(0).getFileName();				
			}
		}
		return fileName;
	}
	
	
	@RequestMapping(value = "/musical_modify", method = RequestMethod.GET)
	public String admin_musical_modifyGET(int musical_id,Model model) throws Exception {
		String table_name="musical";
		String table_crud="doc_create";
		String fileName = file_read(musical_id,table_name,table_crud);
		model.addAttribute("fileName", fileName);			
		model.addAttribute("MusicalDto", musicalService.musical_read(musical_id));
		return "admin/musical_modify";
	}
	
	@RequestMapping(value = "/musical_modify", method = RequestMethod.POST)
	public String admin_musical_modifyPOST(MusicalDto musical,MultipartFile file,RedirectAttributes rttr) throws Exception {
		String savedName=posterUploadFile(file.getOriginalFilename(),file.getBytes());
		musical.setMusical_poster(savedName);
		System.out.println(musical.getMusical_id());
		musicalService.musical_update(musical);
		//reason,content와 고객아이디_뮤지컬아이디을 admin테이블에 저장
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_musical";
	}	

	@RequestMapping(value = "/character_read", method = RequestMethod.GET)
	public String admin_musical_read(int musical_id,BoardVo vo,Model model) throws Exception {
		model.addAttribute("list", musicalService.musical_read(musical_id));
		model.addAttribute("character_list", characterService.character_read(vo,musical_id));
		vo.setTotalCount(characterService.character_listSearchCount(musical_id));
		String fileName=file_read(musical_id,"musical","doc_create");
		model.addAttribute("fileName", fileName);
		return "admin/character_read";
	}
	
	@RequestMapping(value = "/actor_list", method = RequestMethod.POST) //ajax
	public ResponseEntity<List<ActorDto>> actor_list() throws Exception {
		List<ActorDto> searchList = actorService.actor_all();
		return ResponseEntity.ok(searchList);	
	}
	
		
	@RequestMapping(value = "/character_register", method = RequestMethod.POST)
	public String character_register(@RequestParam(value="musical_id[]") List<Integer> musical_id,@RequestParam(value="character_name[]") List<String> character_name, 
			@RequestParam(value="actor_id[]") List<Integer> actor_id,String searchType,String fileName,BoardVo vo, Model model, RedirectAttributes rttr) throws Exception {		
		List<CharacterDto> characterList = new ArrayList<>();
	    for (int i = 0; i < character_name.size(); i++) {
	        CharacterDto character = new CharacterDto();
	        character.setCharacter_name(character_name.get(i));
	        character.setActor_id(actor_id.get(i));
		character.setMusical_id(musical_id.get(i));
		characterService.character_create(character);
		acService.actor_character_create(character);
	    }
	    
	    rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/character_read?musical_id=" + musical_id.get(0);
	}
	
	
	@RequestMapping(value = "/character_remove", method = RequestMethod.POST)
	@ResponseBody
	public String character_remove(@RequestParam("character_id") int character_id,
	        @RequestParam("reason") String reason) throws Exception {
	    AdminDto dto = AdminDto.withoutFileName("character", character_id, characterService.character_read_delete(character_id).getCharacter_name(), "table_delete", reason);
	    file_register(dto);
	    characterService.character_delete(character_id);    
	    
	    return "success";  // 성공 메시지 반환 (뷰가 아닌 단순 텍스트로)
	}
	
	@RequestMapping(value = "/character_modify", method = RequestMethod.POST)
	@ResponseBody
	public String character_modify(@RequestParam("character_id") int character_id,
			@RequestParam("musical_id") int musical_id,
	        @RequestParam("character_name") String character_name,
	        @RequestParam("actor_id") int actor_id,
	        RedirectAttributes rttr) throws Exception {
		CharacterDto dto = new CharacterDto(character_id,musical_id,character_name,actor_id);
		ActorCharacterDto acdto = new ActorCharacterDto(character_id,actor_id);
		characterService.character_update(dto);    
		acService.actor_character_update(acdto);
	    
	    return "success";  // 성공 메시지 반환 (뷰가 아닌 단순 텍스트로)
	}
	
	@RequestMapping(value = "/admin_venue", method = RequestMethod.GET)
	public String admin_venue(BoardVo vo, Model model) throws Exception {
		List<VenueDto> searchList = venueservice.venue_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(venueservice.venue_listSearchCount(vo));
		return "admin/admin_venue";
	}
	
	@RequestMapping(value = "/venue_register_file", method = RequestMethod.GET)
	public String venue_register_file(@RequestParam("searchType") String searchType,@RequestParam("fileName") String fileName,Model model) throws Exception {		
		if(!fileName.equals(null)) {
			model.addAttribute("searchType",searchType);
			model.addAttribute("fileName",fileName);
		}
		return "admin/venue_register";
	}
	
	@RequestMapping(value = "/venue_register", method = RequestMethod.GET)
	public String venue_registerGET() throws Exception {
		return "admin/venue_register";
	}
	
	@RequestMapping(value = "/venue_register", method = RequestMethod.POST)
	public String venue_registerPOST(VenueDto venue,double latitude, double longitude,String searchType,String fileName,BoardVo vo ,Model model, RedirectAttributes rttr) throws Exception {
		venueservice.venue_create(venue);
		List<VenueDto> searchList=venueservice.venue_listSearch(vo);
		int table_id=searchList.get(0).getVenue_id();
		Venue_apiDto dtos=new Venue_apiDto(longitude,latitude,table_id);
		venue_apiservice.venue_api_create(dtos);
		if(!fileName.equals("")) {
			String table_name="venue";
			String table_crud="doc_create";
			String crud_reason="문서등록";			
			AdminDto dto=AdminDto.withoutTableContent(table_name,table_id,table_crud,crud_reason,fileName);
			file_register(dto);
			moveFile(fileName, searchType);
		}
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_venue";
	}
	
	@RequestMapping(value = "/venue_modify", method = RequestMethod.GET)
	public String admin_venue_modifyGET(int venue_id,Model model) throws Exception {
		String table_name="venue";
		String table_crud="doc_create";
		String fileName = file_read(venue_id,table_name,table_crud);
		model.addAttribute("fileName", fileName);			
		model.addAttribute("VenueDto", venueservice.venue_read(venue_id));
		return "admin/venue_modify";
	}
	
	@RequestMapping(value = "/venue_modify", method = RequestMethod.POST)
	public String admin_venue_modifyPOST(VenueDto venue,RedirectAttributes rttr) throws Exception {
		venueservice.venue_update(venue);
		//reason,content와 고객아이디_뮤지컬아이디을 admin테이블에 저장
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_venue";
	}
	
	@RequestMapping(value = "/venue_remove", method = RequestMethod.POST)
	@ResponseBody
	public String admin_venue_remove(int venue_id, RedirectAttributes rttr,String reason) throws Exception {		
		if(reservationservice.reservation_venuecheck(venue_id).size()==0) {
			AdminDto dto=AdminDto.withoutFileName("venue",venue_id,venueservice.venue_read(venue_id).getVenue_name(),"table_delete",reason);
			file_register(dto);
			seatservice.seat_venueAlldelete(venue_id);
			mu_schservice.musical_schedule_venuedelete(venue_id);	
			hallservice.hall_vanuedelete(venue_id);
			venue_apiservice.venue_api_delete(venue_id);	
			venueservice.venue_delete(venue_id);
			return "success";
		}else {
			return  "fail";
		}
		
	}
	
	@RequestMapping(value = "/admin_hall", method = RequestMethod.POST)
	public ResponseEntity<Map<String,Object>> HallAjax(@RequestBody Map<String, String> request,BoardVo vo) throws Exception {
		vo.setfGroupKind(request.get("venue_id"));	
		vo.setPage(Integer.parseInt(request.get("page")));
		vo.setPerPageNum(Integer.parseInt(request.get("perPageNum")));		
		Map<String,Object> map=new HashMap<>();
		List<HallDto> list= hallservice.hall_listSearch(vo);
		vo.setTotalCount(hallservice.hall_listSearchCount(vo));
		map.put("list",list);
		map.put("boardVo",vo);
		return ResponseEntity.ok(map);	
	}
	
	@RequestMapping(value = "/hall_register_file", method = RequestMethod.GET)
	public String hall_register_file(@RequestParam("searchType") String searchType,@RequestParam("fileName") String fileName,@RequestParam("table_id") int table_id,Model model) throws Exception {		
		if(!fileName.equals(null)) {
			model.addAttribute("venue_id",table_id);
			model.addAttribute("searchType",searchType);
			model.addAttribute("fileName",fileName);
		}
		return "admin/hall_register";
	}
	
	@RequestMapping(value = "/hall_register", method = RequestMethod.GET)
	public String hall_registerGET(int venue_id, Model model) throws Exception {
		model.addAttribute("venue_id",venue_id);
		return "admin/hall_register";
	}
	
	@RequestMapping(value = "/hall_register", method = RequestMethod.POST)
	public String hall_registPOST(HallDto hall,String searchType,String fileName,BoardVo vo ,Model model, RedirectAttributes rttr) throws Exception {
		hallservice.hall_create(hall);
		if(!fileName.equals("")) {
			String table_name="hall";
			String table_crud="doc_create";
			String crud_reason="문서등록";
			List<HallDto> searchList=hallservice.hall_listSearch(vo);
			int table_id=searchList.get(0).getHall_id();
			AdminDto dto=AdminDto.withoutTableContent(table_name,table_id,table_crud,crud_reason,fileName);
			file_register(dto);
			moveFile(fileName, searchType);
		}
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_venue";
	}
	
	@RequestMapping(value = "/hall_modify", method = RequestMethod.GET)
	public String hall_modifyGET(int hall_id, Model model) throws Exception {
		String fileName = file_read(hall_id,"hall","doc_create");
		model.addAttribute("fileName", fileName);	
		model.addAttribute("hall_read",hallservice.hall_read(hall_id));
		return "admin/hall_modify";
	}
	
	@RequestMapping(value = "/hall_modify", method = RequestMethod.POST)
	public String hall_modifytPOST(HallDto hall,String searchType,String fileName,BoardVo vo ,Model model, RedirectAttributes rttr) throws Exception {
		hallservice.hall_update(hall);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_venue";
	}
	
	@RequestMapping(value = "/hall_remove", method = RequestMethod.POST)
	@ResponseBody
	public String admin_hall_remove(int hall_id, RedirectAttributes rttr,String reason) throws Exception {
		if(reservationservice.reservation_hallcheck(hall_id).size()==0) {
			AdminDto dto=AdminDto.withoutFileName("hall",hall_id,hallservice.hall_read(hall_id).getHall_name(),"table_delete",reason);
			file_register(dto);
			seatservice.seat_hallAlldelete(hall_id);
			mu_schservice.musical_schedule_halldelete(hall_id);	
			hallservice.hall_delete(hall_id);
			return "success";
		}else {
			return  "fail";
		}		
	}
	
	@RequestMapping(value = "/admin_review", method = RequestMethod.GET)
	public String admin_review(BoardVo vo, Model model) throws Exception {
		List<ReviewDto> searchList = rService.review_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(rService.review_listSearchCount(vo));
		
		List<ReviewDto> AllList = rService.review_listAll(vo);
		List<String> CustomerIdList = AllList.stream()
			    .map(ReviewDto::getCustomer_id) // ReviewDto 객체에서 customer_id 추출
			    .distinct() // 중복값 제거
			    .collect(Collectors.toList()); // 리스트로 수집		
		model.addAttribute("Cidlist", CustomerIdList);
		
		List<String> MusicalIdList = AllList.stream()
			    .map(ReviewDto::getMusical_title) // ReviewDto 객체에서 customer_id 추출
			    .distinct() // 중복값 제거
			    .collect(Collectors.toList()); // 리스트로 수집		
		model.addAttribute("Midlist", MusicalIdList); 
		return "admin/admin_review";
	}
	
	@RequestMapping(value = "/review_remove", method = RequestMethod.GET)
	public String admin_review_remove(int review_id, RedirectAttributes rttr,String reason) throws Exception {
		AdminDto dto=AdminDto.withoutFileName("review",review_id,rService.review_read(review_id).getContent(),"review_delete",reason);
		file_register(dto);
		rService.delete(review_id);
		//reason,content와 고객아이디_뮤지컬아이디을 admin테이블에 저장
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_review";
	}
		
	
	@RequestMapping(value = "/actor_read", method = RequestMethod.GET)
	public String actor_read(int actor_id,BoardVo vo, Model model) throws Exception {	
		model.addAttribute("actor_read",actorService.actor_read(actor_id));
		model.addAttribute("character_list",characterService.character_actor(actor_id,vo));
		vo.setTotalCount(characterService.character_actor_listSearchCount(actor_id));
		return "admin/actor_read";
	}
	
	@RequestMapping(value = "/admin_actor", method = RequestMethod.GET)
	public String admin_actor(BoardVo vo, Model model) throws Exception {
		List<ActorDto> searchList = actorService.actor_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(actorService.actor_listSearchCount(vo));
		return "admin/admin_actor";
	}
	
	@RequestMapping(value = "/actor_register_file", method = RequestMethod.GET)
	public String actor_register_file(@RequestParam("searchType") String searchType,@RequestParam("fileName") String fileName,Model model) throws Exception {		
		if(!fileName.equals(null)) {
			model.addAttribute("searchType",searchType);
			model.addAttribute("fileName",fileName);
		}
		return "admin/actor_register";
	}
	
	@RequestMapping(value = "/actor_register", method = RequestMethod.GET)
	public String actor_registerGET() throws Exception {
		return "admin/actor_register";
	}
	
	@RequestMapping(value = "/actor_register", method = RequestMethod.POST)
	public String actor_registPOST(ActorDto actor,String searchType,MultipartFile file,
			 String fileName,BoardVo vo ,Model model, RedirectAttributes rttr) throws Exception {
		String savedName=actorUploadFile(file.getOriginalFilename(),file.getBytes());
		actor.setActor_img(savedName);
		actorService.actor_create(actor);
		if(!fileName.equals("")) {
			String table_name="actor";
			String table_crud="doc_create";
			String crud_reason="문서등록";
			List<ActorDto> searchList=actorService.actor_listSearch(vo);
			int table_id=searchList.get(0).getActor_id();
			AdminDto dto=AdminDto.withoutTableContent(table_name,table_id,table_crud,crud_reason,fileName);
			file_register(dto);
			moveFile(fileName, searchType);
		}
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_actor";
	}
	
	@RequestMapping(value = "/actor_modify", method = RequestMethod.GET)
	public String admin_actor_modifyGET(int actor_id,Model model) throws Exception {
		String table_name="actor";
		String table_crud="doc_create";
		String fileName = file_read(actor_id,table_name,table_crud);
		model.addAttribute("fileName", fileName);	
		model.addAttribute("actorDto", actorService.actor_read(actor_id));
		return "admin/actor_modify";
	}
	
	@RequestMapping(value = "/actor_modify", method = RequestMethod.POST)
	public String admin_actor_modifyPOST(ActorDto actor,MultipartFile file,RedirectAttributes rttr) throws Exception {
		String savedName=actorUploadFile(file.getOriginalFilename(),file.getBytes());
		actor.setActor_img(savedName);
		actorService.update(actor);		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_actor";
	}	
	
	@RequestMapping(value = "/actor_remove", method = RequestMethod.POST)
	@ResponseBody
	public String admin_actor_remove(int actor_id, String reason) throws Exception {
		AdminDto dto=AdminDto.withoutFileName("actor",actor_id,actorService.actor_read(actor_id).getActor_name(),"table_delete",reason);
		file_register(dto);
		actorService.delete(actor_id);	
		return "success";
	}	
	
	@RequestMapping(value = "/admin_users", method = RequestMethod.GET)
	public String admin_users(BoardVo vo, Model model) throws Exception {
		List<CustomerDto> searchList = customerService.customer_listSearch(vo);
		model.addAttribute("list", searchList);
		vo.setTotalCount(customerService.customer_listSearchCount(vo));
		return "admin/admin_users";
	}
	
	@RequestMapping(value = "/users_modify", method = RequestMethod.POST)
	@ResponseBody
	public String admin_users_modifyPOST(CustomerDto dto,RedirectAttributes rttr) throws Exception {
		AuthoritiesDto adto=new AuthoritiesDto(dto.getCustomer_id(),dto.getAuthority());
		System.out.println(dto.getAuthority());
		customerService.enabledUpdate(dto);	
		authoritiesService.authorityUpdate(adto);
		return "success";
	}

	
	@RequestMapping("/admin_files")
	public String listFiles(Model model,BoardVo vo) throws Exception {
		String resourcesFolderPath = servletContext.getRealPath("/resources/static");
		String directoryPath = resourcesFolderPath+"/scan";
		if(vo.getSearchType()!=null) {
			if(!vo.getSearchType().equals("")) {
				String folder=vo.getSearchType();
				directoryPath = resourcesFolderPath+"/"+folder;
			}
		}
        File directory = new File(directoryPath);
        List<Map<String, Object>> filesList = new ArrayList<>();
        
        if (directory.exists() && directory.isDirectory()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        Map<String, Object> fileInfo = new HashMap<>();
                        fileInfo.put("fileName", file.getName());
                        fileInfo.put("creationDate", new Date(file.lastModified()));
                        filesList.add(fileInfo);
                    }
                }
            }
        }
        vo.setTotalCount(filesList.size());
        int page=vo.getPage();        
        int fromIndex = (page - 1) * 10;
        int toIndex = Math.min(fromIndex + 10, filesList.size());
        if (fromIndex > filesList.size()) {
        	model.addAttribute("filesList", new ArrayList<>()); // 페이지가 범위를 초과할 경우 빈 리스트 반환
        }else {     
        	model.addAttribute("filesList", filesList.subList(fromIndex, toIndex));
        }
        return "admin/admin_files";
    }
	

    @RequestMapping("/admin_fileRemove")
    public String removeFile(@RequestParam("fileName") String fileName, @RequestParam("searchType") String searchType) {
    	String resourcesFolderPath = servletContext.getRealPath("/resources/static");
    	String directoryPath = resourcesFolderPath + "/scan";
		
		if(searchType!=null) {
			if(!searchType.equals("")) {
				String folder=searchType;
				directoryPath = resourcesFolderPath+"/"+folder;
			}
		}
        File file = new File(directoryPath + File.separator + fileName);
        if (file.exists()) {
            file.delete(); // 파일 삭제
        }
        return "redirect:/admin/admin_files"; // 삭제 후 파일 리스트 페이지로 리다이렉트
    }

    @RequestMapping("/admin_fileView")
    public void viewFile(@RequestParam("fileName") String fileName, HttpServletResponse response, @RequestParam("searchType") String searchType) throws IOException {
    	String resourcesFolderPath = servletContext.getRealPath("/resources/static");
    	String directoryPath = resourcesFolderPath+"/scan";
		
		if(searchType!=null) {
			if(!searchType.equals("")) {
				String folder=searchType;
				directoryPath = resourcesFolderPath+"/"+folder;
			}
		}
        File file = new File(directoryPath + File.separator + fileName);

        if (file.exists()) {
            // TIFF 파일인지 확인
            if (fileName.toLowerCase().endsWith(".tiff") || fileName.toLowerCase().endsWith(".tif")) {
                try (PDDocument document = new PDDocument()) {
                    ImageInputStream iis = ImageIO.createImageInputStream(file);
                    Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);
                    ImageReader reader = null;

                    if (readers.hasNext()) {
                        reader = readers.next();
                        reader.setInput(iis);
                    }

                    if (reader == null) {
                        response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "TIFF 파일을 읽을 수 없습니다.");
                        return;
                    }

                    for (int i = 0; i < reader.getNumImages(true); i++) {
                        BufferedImage tiffImage = reader.read(i);
                        PDPage page = new PDPage();
                        document.addPage(page);
                        PDImageXObject pdImage = PDImageXObject.createFromFileByContent(file, document);
                        PDPageContentStream contentStream = new PDPageContentStream(document, page);
                        contentStream.drawImage(pdImage, 0, 0, page.getMediaBox().getWidth(), page.getMediaBox().getHeight());
                        contentStream.close();
                    }

                    response.setContentType("application/pdf");
                    document.save(response.getOutputStream());
                    response.getOutputStream().flush();
                } catch (IOException e) {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "TIFF 파일 변환 중 오류가 발생했습니다.");
                }
            } else {
                // TIFF 파일이 아닌 경우, 기본적으로 파일을 전송
                response.setContentType(Files.probeContentType(file.toPath()));
                Files.copy(file.toPath(), response.getOutputStream());
                response.getOutputStream().flush();
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
        }
    }
    
    @RequestMapping(value = "/admin_fileIdSelect", method = RequestMethod.POST)
	public ResponseEntity<List<AdminDto>> fileIdSelect(@RequestParam("input_id") String input_id, BoardVo vo) throws Exception {
    	List<AdminDto> dtos=new ArrayList<>();
		if("musical".equals(input_id)) {
			List<MusicalDto> musicalDtos= musicalService.musical_listSearch(vo);
			 for (MusicalDto musicalDto : musicalDtos) {
		            int table_id = musicalDto.getMusical_id();
		            String table_name = musicalDto.getMusical_title();
		            AdminDto dto=new AdminDto(table_id,table_name);
		            dtos.add(dto);
			 }			
		}else if("venue".equals(input_id)) {
			List<VenueDto> venueDtos= venueservice.venue_listSearch(vo);
			for (VenueDto venueDto : venueDtos) {
	            int table_id = venueDto.getVenue_id();
	            String table_name = venueDto.getVenue_name();
	            AdminDto dto=new AdminDto(table_id,table_name);
	            dtos.add(dto);
			}
		}else if("hall".equals(input_id)) {
			List<VenueDto> venueDtos= venueservice.venue_listSearch(vo);
			for (VenueDto venueDto : venueDtos) {
	            int table_id = venueDto.getVenue_id();
	            String table_name = venueDto.getVenue_name();
	            AdminDto dto=new AdminDto(table_id,table_name);
	            dtos.add(dto);
			}
		}else if("actor".equals(input_id)) {
			List<ActorDto> actorDtos= actorService.actor_listSearch(vo);
			for (ActorDto actorDto : actorDtos) {
	            int table_id = actorDto.getActor_id();
	            String table_name = actorDto.getActor_name();
	            AdminDto dto=new AdminDto(table_id,table_name);
	            dtos.add(dto);
			}
		}else if("character".equals(input_id)) {
			List<MusicalDto> musicalDtos= musicalService.musical_listSearch(vo);
			 for (MusicalDto musicalDto : musicalDtos) {
		            int table_id = musicalDto.getMusical_id();
		            String table_name = musicalDto.getMusical_title();
		            AdminDto dto=new AdminDto(table_id,table_name);
		            dtos.add(dto);
			}
		}			
		return ResponseEntity.ok(dtos);	
	}
    
    @RequestMapping(value = "/admin_fileAdd", method = RequestMethod.POST)
   	public String fileAdd(@RequestParam("fileName") String fileName, @RequestParam("table_name") String table_name, @RequestParam("table_id") int table_id,@RequestParam("searchType") String searchType) throws Exception {
    	String table_crud="doc_create";
		String crud_reason="문서등록";
		String fileName_temp=fileName;
		if(fileName.substring(fileName.length()-4, fileName.length()).equals("tiff")) {
			fileName_temp=fileName.substring(fileName.length()-4)+".pdf";
		}
		AdminDto dto=AdminDto.withoutTableContent(table_name,table_id,table_crud,crud_reason,fileName_temp);
		file_register(dto);
		System.out.println(searchType);
		moveFile(fileName, searchType);	
		return "redirect:/admin/admin_files";
    }
    
    public void file_register(AdminDto dto) throws Exception {
    	service.admin_create(dto);
    }
	
	public void moveFile(String fileName, String searchType) throws IOException {
		String resourcesFolderPath = servletContext.getRealPath("/resources/static");
		if(searchType.equals("scan")) {			
			String sourceDirectoryPath = resourcesFolderPath+"/scan";
            String targetDirectoryPath = resourcesFolderPath+"/document";

            File sourceFile = new File(sourceDirectoryPath + File.separator + fileName);
            File targetFile = new File(targetDirectoryPath + File.separator + fileName);

            if (sourceFile.exists()) {
                sourceFile.renameTo(targetFile);
            }
		}
		String directoryPath = resourcesFolderPath+"/document";
		
        File file = new File(directoryPath + File.separator + fileName);

        if (file.exists()) {
            if (fileName.toLowerCase().endsWith(".tiff") || fileName.toLowerCase().endsWith(".tif")) {
                String outputFileName = fileName.substring(0, fileName.lastIndexOf(".")) + ".pdf";
                File outputFile = new File(directoryPath + File.separator + outputFileName);

                try (PDDocument document = new PDDocument()) {
                    ImageInputStream iis = ImageIO.createImageInputStream(file);
                    Iterator<ImageReader> readers = ImageIO.getImageReaders(iis);
                    ImageReader reader = null;

                    if (readers.hasNext()) {
                        reader = readers.next();
                        reader.setInput(iis);
                    }

                    if (reader != null) {
                        for (int i = 0; i < reader.getNumImages(true); i++) {
                            BufferedImage tiffImage = reader.read(i);
                            PDPage page = new PDPage();
                            document.addPage(page);
                            PDImageXObject pdImage = PDImageXObject.createFromFileByContent(file, document);
                            PDPageContentStream contentStream = new PDPageContentStream(document, page);
                            contentStream.drawImage(pdImage, 0, 0, page.getMediaBox().getWidth(), page.getMediaBox().getHeight());
                            contentStream.close();
                        }

                        // 변환된 PDF 파일을 원본 폴더에 저장
                        document.save(outputFile);
                        document.close();
                        System.out.println("파일이 성공적으로 변환되어 저장되었습니다: " + outputFileName);

                        // 변환 후 원본 TIFF 파일 삭제
                        if (file.delete()) {
                            System.out.println("원본 TIFF 파일이 삭제되었습니다: " + fileName);
                        } else {
                            System.err.println("원본 TIFF 파일 삭제에 실패했습니다: " + fileName);
                        }
                    } else {
                        System.err.println("TIFF 파일을 읽을 수 없습니다: " + fileName);
                    }
                } catch (IOException e) {
                    System.err.println("TIFF 파일 변환 중 오류가 발생했습니다: " + e.getMessage());
                }
            } else {
                System.err.println("지원되지 않는 파일 형식입니다: " + fileName);
            }
        } else {
            System.err.println("파일을 찾을 수 없습니다: " + fileName);
        }
	}
	
	@RequestMapping("/admin_filesView")
	public void viewFiles(@RequestParam("fileNames") String fileNames, HttpServletResponse response, @RequestParam("searchType") String searchType) throws IOException {
		String baseDirectoryPath = servletContext.getRealPath("/resources/static");
	    String directoryPath = baseDirectoryPath + "/scan"; // 기본 디렉토리 경로

	    if (searchType != null && !searchType.isEmpty()) {
	        directoryPath = baseDirectoryPath + "/" + searchType; // searchType에 따라 디렉토리 변경
	    }

	    String[] filesArray = fileNames.split(","); // 파일명을 구분자로 분리
	    
	    // `directoryPath`를 final로 사용하기 위한 처리
	    final String finalDirectoryPath = directoryPath;

	    List<File> files = Arrays.stream(filesArray)
	            .map(fileName -> new File(finalDirectoryPath + File.separator + fileName))
	            .filter(File::exists)
	            .collect(Collectors.toList());

	    if (files.isEmpty()) {
	        response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
	        return;
	    }

	    // 여러 파일을 슬라이드처럼 보여주는 HTML 생성
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    out.println("<html><head><style>" +
	            ".slide { display: none; }" +
	            ".prev, .next { cursor: pointer; position: absolute; top: 50%; width: auto; padding: 16px; color: white; font-weight: bold; font-size: 18px; transition: 0.6s ease; border-radius: 3px; }" +
	            ".prev { left: 0; }" +
	            ".next { right: 0; }" +
	            "</style></head><body>");

	    out.println("<div style='position: relative; width: 100%;'>");
	    for (File file : files) {
	        String fileType = Files.probeContentType(file.toPath());

	        if (fileType != null && fileType.startsWith("image")) {
	            // 이미지 파일인 경우
	            out.println("<div class='slide'><img src='data:" + fileType + ";base64," + encodeFileToBase64(file) + "' width='100%' /></div>");
	        } else if ("application/pdf".equals(fileType)) {
	            // PDF 파일인 경우
	            out.println("<div class='slide'><embed src='data:" + fileType + ";base64," + encodeFileToBase64(file) + "' width='100%' height='700px' /></div>");
	        } else {
	            // 다른 타입의 파일에 대한 처리
	            out.println("<div class='slide'><p>등록된 파일이 없거나 지원되지 않는 파일 형식입니다: " + file.getName() + "</p></div>");
	        }
	    }
	    out.println("<a class='prev' onclick='plusSlides(-1)'>&#10094;</a>");
	    out.println("<a class='next' onclick='plusSlides(1)'>&#10095;</a>");
	    out.println("</div>");

	    out.println("<script>" +
	            "let slideIndex = 1;" +
	            "showSlides(slideIndex);" +

	            "function plusSlides(n) {" +
	            "    showSlides(slideIndex += n);" +
	            "}" +

	            "function showSlides(n) {" +
	            "    let slides = document.querySelectorAll('.slide');" +
	            "    if (n > slides.length) {slideIndex = 1}" +
	            "    if (n < 1) {slideIndex = slides.length}" +
	            "    for (let i = 0; i < slides.length; i++) {" +
	            "        slides[i].style.display = 'none';" +
	            "    }" +
	            "    slides[slideIndex-1].style.display = 'block';" +
	            "}" +
	            "</script>");

	    out.println("</body></html>");
	}

	private String encodeFileToBase64(File file) throws IOException {
	    byte[] fileContent = Files.readAllBytes(file.toPath());
	    return Base64.getEncoder().encodeToString(fileContent);
	}
	
	//엑셀 다운로드
	@Autowired
    private ExcelService excelService;


    @RequestMapping("/musical_excel")
    public void downloadMusicalExcel(BoardVo vo, HttpServletResponse response) throws Exception {
        byte[] excelData = excelService.generateMusicalExcel(vo);

        String fileName = "musicals.xlsx";

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        response.setContentLength(excelData.length);

        try {
            response.getOutputStream().write(excelData);
            response.getOutputStream().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
}
