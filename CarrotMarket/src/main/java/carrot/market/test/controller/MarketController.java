package carrot.market.test.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import carrot.market.test.model.Product;
import carrot.market.test.model.User;
import carrot.market.test.service.MarketService;
import carrot.market.test.util.DateService;
import carrot.market.test.util.FileService;

/**
 * @Author : 전상수
 * @Date : 2019. 11. 08.
 * @Class 설명 : 당근마켓 컨트롤러
 * 
 */
@Controller
public class MarketController {

	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);
	@Autowired
	MarketService service;

	final String uploadPath = "C:\\apache-tomcat-8.0.45\\webapps\\CarrotMarket\\resources\\images\\"; // 파일 업로드 경로

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	// 로그인페이지가기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goHome(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("email") != null) {
			return "redirect:/index";
		}
		return "signin";
	}

	// 회원가입페이지가기
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(Locale locale, Model model) {
		return "signup";
	}

	// 아이템업로드페이지가기
	@RequestMapping(value = "/item_create", method = RequestMethod.GET)
	public String item_create(HttpSession session,String category,Model model) {
		if (session.getAttribute("email") == null) {
			return "redirect:/";
		}
		model.addAttribute("category",category);
		return "item_create";
	}

	// 특정카테고리 페이지이동 & 제품들가져오기
	@RequestMapping(value = "/goCategorized", method = RequestMethod.GET)
	public String goCategorized(String category, Model model) {

		List<Product> pList = service.selectProductByCategory(category);

		for (Product p : pList) {
			int diff = DateService.diffDate(p.getCreated_at());
			p.setDiffDays(diff);
		}

		model.addAttribute("pList", pList);
		model.addAttribute("category", category);

		return "categorized_index";
	}

	// 특정 제품 가져오기 & 특정 제품 보기페이지 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String seq, Model model) {

		Product product = service.selectProductBySeq(seq);

		if(product==null){
			return "redirect:/index";
		}
		
		if(product.getCategory().equals("차량")){
			product=service.selectCarBySeq(seq);
			int diffYear=DateService.diffYear(product.getMadedate());

			model.addAttribute("diffYear", diffYear);
		}

		int diff = DateService.diffDate(product.getCreated_at());
		product.setDiffDays(diff);

		model.addAttribute("product", product);

		return "detail";
	}

	// 아이템업로드
	@RequestMapping(value = "/uploadItem", method = RequestMethod.POST)
	public String uploadItem(HttpSession session, MultipartFile upload, Product product,
			@RequestParam(value = "randistances", defaultValue = "0") int randistance) {

		if (session.getAttribute("email") == null) {
			return "redirect:/";
		} else {
			String email = (String) session.getAttribute("email");
			product.setEmail(email);
		}

		product.setRandistance(randistance);

		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			product.setImage(savedfile);

			int productseq = service.insertProduct(product);

			if (product.getCategory().equals("차량") && productseq == 1) {
				service.insertCar(product);
			}

		}
		return "redirect:/index";
	}

	// 상품진열페이지
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model, HttpSession session) {

		if (session.getAttribute("email") == null) {
			return "redirect:/";
		} else {
			List<Product> pList = service.selectProducts();

			for (Product p : pList) {
				int diff = DateService.diffDate(p.getCreated_at());
				p.setDiffDays(diff);
			}

			model.addAttribute("pList", pList);
		}

		return "index";
	}

	// 로그인
	@RequestMapping(value = "/signinAccount", method = RequestMethod.POST)
	public String signinAccount(User user, Model model, HttpSession session) {

		User result = service.selectUser(user);

		if (result == null) {
			model.addAttribute("message", "이메일과 비밀번호를 확인해주세요.");
			return "signin";
		} else {
			session.setAttribute("email", result.getEmail());
		}

		return "redirect:/index";
	}

	// 계정만들기
	@RequestMapping(value = "/signupAccount", method = RequestMethod.POST)
	public String signupAccount(User user, Model model) {
		int result = service.insertUser(user);

		if (result != 1) {
			model.addAttribute("message", "존재하는 이메일입니다.");
			return "signup";
		}

		return "signin";
	}
	
	// ajax 차량 필터
	@RequestMapping(value = "/filteCars", method = RequestMethod.POST)
	public @ResponseBody List<Product> filteCars(String sliderCarModelYear,String sliderCarMileage, String formRadiosSmoking) {
		
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("YearFrom", sliderCarModelYear.split(",")[0]);
		map.put("YearTo", sliderCarModelYear.split(",")[1]);
		map.put("MileageFrom", sliderCarMileage.split(",")[0]);
		map.put("MileageTo", sliderCarMileage.split(",")[1]);
		if(formRadiosSmoking.equals("option1")){
			map.put("issmoke", "true");
		}else{
			map.put("issmoke","false");
		}
		
		List<Product> pList = service.selectCarByFilter(map);
		return pList;
	}

	// ajax 차량 초기화
	@RequestMapping(value = "/rollBackBtn", method = RequestMethod.POST)
	public @ResponseBody List<Product> rollBackBtn() {
		List<Product> pList = service.selectProductByCategory("차량");

		return pList;
	}

}
