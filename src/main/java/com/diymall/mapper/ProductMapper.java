package com.diymall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.diymall.dto.ProductDTO;

@Mapper
public interface ProductMapper {

    List<ProductDTO> selectProductList();
    
    ProductDTO selectProductById(int productId);

    // 상품 등록
    void insertProduct(ProductDTO product);
    
    // 상품 수정
    void updateProduct(ProductDTO product);
    
    int countOrderItemsByProductId(int productId);

    int countReviewsByProductId(int productId);

    void deleteProduct(int productId);
}