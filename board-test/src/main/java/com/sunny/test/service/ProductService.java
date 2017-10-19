package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.ProductMapper;
import com.sunny.test.dao.PromoMapper;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.ProductVO;
 
@Service
public class ProductService {
 
    @Autowired
    ProductMapper productMapper;
 
    /* select All Product List */
    public  List<ProductVO>getAllProductList() throws Exception{
    	        return productMapper.getAllProductList();
    }
 
    public  ProductVO getProductInfo(String product_code) throws Exception{
        return productMapper.getProductInfo(product_code);
    }
}
