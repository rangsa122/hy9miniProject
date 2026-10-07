package com.diymall.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.diymall.dto.ProductDTO;
import com.diymall.mapper.ProductMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper productMapper;

    public List<ProductDTO> getProductList() {
        return productMapper.selectProductList();
    }

    public ProductDTO getProduct(int productId) {
        return productMapper.selectProductById(productId);
    }
    
    public void addProduct(ProductDTO product) {
        productMapper.insertProduct(product);
    }
    
    public void updateProduct(ProductDTO product) {
        productMapper.updateProduct(product);
    }
    
    @Transactional
    public void deleteProduct(int productId) {

        int orderItemCount =
                productMapper.countOrderItemsByProductId(productId);

        if (orderItemCount > 0) {
            throw new IllegalStateException(
                    "주문 내역이 있는 상품은 삭제할 수 없습니다."
            );
        }

        int reviewCount =
                productMapper.countReviewsByProductId(productId);

        if (reviewCount > 0) {
            throw new IllegalStateException(
                    "리뷰가 있는 상품은 삭제할 수 없습니다."
            );
        }

        productMapper.deleteProduct(productId);
    }
}