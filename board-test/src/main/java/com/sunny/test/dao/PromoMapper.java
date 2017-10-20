package com.sunny.test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.BlobFromLocator;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.PromotionVO;

public interface PromoMapper {
    /* DB Select  */

    public List<BenefitVO>getBenefit(Map<String, Object> para)throws Exception; //추가
    
    public int getMaxPromoId(String insert_date)throws Exception; //추가
    
    public int insertTest()throws Exception; //추가
    
    public int InsertPromotion(PromotionVO p)throws Exception ;
    
    
}