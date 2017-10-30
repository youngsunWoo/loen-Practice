package com.sunny.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sunny.test.Authentication;
import com.sunny.test.service.ProductService;
import com.sunny.test.service.PromoService;
import com.sunny.test.service.UserService;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.ParticipateListVO;
import com.sunny.test.vo.ProductVO;
import com.sunny.test.vo.PromotionVO;
import com.sunny.test.vo.PurchaseVO;
import com.sunny.test.vo.UserVO;
 
@RestController
public class PromotionController {
    
    @Autowired
    PromoService promoService;
    
    @Autowired
    UserService userService;
    

    @Autowired
    ProductService productService;
    
    
    @RequestMapping(value="/")      
    public ModelAndView root() {
         return new ModelAndView("index");        
    }
    

    //The Form to make Promotion
    //프로모션 생성하기 
    @Authentication
    @RequestMapping(value="Promotion/FormNewPromotion")      
    public ModelAndView promo() {
        return new ModelAndView("Promotion/promotionForm");        
    }
    
    //Insert Promotion Information to Database
    //프로모션 저장하기 (DB insert)
    @Authentication
    @RequestMapping(value="Promotion/insertPromotion", method = RequestMethod.POST)      
    public PromotionVO makeNewPromotion(HttpServletRequest request) throws Exception{
	
    		String promo_type = request.getParameter("promo_type");
		String benefit_code = request.getParameter("benefit_code");
		String product_code = request.getParameter("product_code");

		return promoService.insertPromotion(request.getSession(), promo_type, benefit_code, product_code);
		
    }
    
        
    //get(show) Promotion Detail Information
    //프로모션 상세페이지 출력 (parameter : 프로모션 ID)
    @RequestMapping(value="Promotion/Detail", method = RequestMethod.GET)      
    public ModelAndView promoDetail(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		PromotionVO  promotion = promoService.getPromotionById(promotion_id);
    		UserVO ownUser = userService.getUserById(promotion.getUser_id());
    		ProductVO product = productService.getProductInfo(promotion.getProduct_code());
    		List<BenefitVO> benefits = promoService.getBenefit(promotion.getPromo_type(), promotion.getBenefit_code());
    		
    		mav.addObject("promotion",promotion);
    		mav.addObject("ownUser",ownUser);
    		mav.addObject("product",product);

    		String benefits_json = new Gson().toJson(benefits);
    		
    		System.out.println(benefits_json);
    		mav.addObject("benefits",benefits_json);
    		
    		mav.setViewName("Promotion/promotionDetail");
    		
    		return mav;
        
    }
    
    
    //Promotion Share PopupPage
    //프로모션 공유 페이지 출력
    @RequestMapping(value="Promotion/SharePopup", method = RequestMethod.GET)      
    public ModelAndView sharePopup(HttpServletRequest request , HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();
    		
    		String promotion_id = request.getParameter("promotion_id");
		String flag = request.getParameter("flag");
		System.out.println(flag);

		mav.addObject("promotion_id",promotion_id);
		
		if(flag.equals("0")) {
			mav.setViewName("Promotion/sharePopup");
			
		}if(flag.equals("1")) {

			mav.setViewName("Promotion/sharePopupP");
			System.out.println("sharePopupP");
		}
    		
    		return mav;
    }
    
    
    //Join to Promotion
    @Authentication
    @RequestMapping(value="Promotion/PaticipatePromotion", method = RequestMethod.POST)   
    public ParticipateListVO joinPromotion(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		
    		PurchaseVO purchase = new PurchaseVO(productCode);
    		
    		ParticipateListVO join = new ParticipateListVO(promoId);
		
    		return promoService.participatePromotion(request.getSession(), purchase, join);
	 
    }
    
    // Join 전 가능 여부 확인 
    @RequestMapping(value="Promotion/checkAbailable", method = RequestMethod.POST)   
    public int checkAbailable(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		
    		return promoService.checkAbailable(request.getSession(), productCode, promoId);
	 
    }
    
    
    
    
    //get Users who joined the Promotion By PromoId
    @RequestMapping(value="Promotion/Detail/JoinList", method = RequestMethod.GET)      
    public ModelAndView getJoinUsersByPromoId(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		List<UserVO> joinUsers = userService.getJoinUsersByPromoId(promotion_id);
    		
    		mav.addObject("joinUsers",joinUsers);
    		mav.setViewName("Promotion/JoinList");
    		return mav;
        
    }
    
    
    @RequestMapping(value="/getBenefitList", method = RequestMethod.GET)     
    public 	List<BenefitVO> getbenefit(HttpServletRequest request) throws Exception{
    		
    		String promo_type = request.getParameter("promo_type");
    		String benefit_code = request.getParameter("benefit_code");

      	List<BenefitVO> benefits = promoService.getBenefit(promo_type, benefit_code);
        return benefits;
    }
    
   
}
