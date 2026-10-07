<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.productName} - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

    <style>
        .detail-container {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 40px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 80px;
        }

        .detail-image {
            width: 100%;
            height: 550px;
            background: #f5f2ed;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .detail-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .detail-info {
            padding: 20px 0;
        }

        .detail-category {
            font-size: 14px;
            color: #888;
        }

        .detail-info h1 {
            margin: 15px 0;
            font-size: 36px;
        }

        .detail-description {
            margin: 30px 0;
            color: #666;
            line-height: 1.8;
        }

        .detail-price {
            font-size: 28px;
            font-weight: bold;
            margin: 30px 0;
        }

        .detail-stock {
            margin-bottom: 30px;
        }

        .quantity-box {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .quantity-box input {
            width: 60px;
            padding: 12px;
            text-align: center;
        }

        .cart-button {
            width: 100%;
            padding: 18px;
            border: none;
            background: #111;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>

<body>

<header class="header">
    <div class="header-inner">

        <a href="/" class="logo">makeit.</a>

        <nav class="nav">
            <a href="#">KIT 쇼핑</a>
            <a href="#">난이도별</a>
            <a href="#">재료·도구</a>
        </nav>

        <div class="header-right">
            <a href="${pageContext.request.contextPath}/member/login">로그인</a>
            <a href="${pageContext.request.contextPath}/cart">장바구니</a>
        </div>

    </div>
</header>


<main>

    <div class="detail-container">

        <div class="detail-image">

            <img
                src="${pageContext.request.contextPath}${product.image}"
                alt="${product.productName}"
            >

        </div>


        <div class="detail-info">

            <span class="detail-category">
                ${product.category}
            </span>

            <h1>
                ${product.productName}
            </h1>

            <p>
                난이도 : ${product.difficulty}
            </p>

            <p class="detail-description">
                ${product.description}
            </p>

            <div class="detail-price">
                ${product.price}원
            </div>

            <div class="detail-stock">
                남은 수량 : ${product.stock}개
            </div>

            <form
			    action="${pageContext.request.contextPath}/cart/add"
			    method="post">
			
			    <input
			        type="hidden"
			        name="productId"
			        value="${product.productId}"
			    >
			
			    <div class="quantity-box">
			
			        <label for="quantity">
			            수량
			        </label>
			
			        <input
			            type="number"
			            id="quantity"
			            name="quantity"
			            value="1"
			            min="1"
			            max="${product.stock}"
			        >
			
			    </div>
			
			    <button
			        type="submit"
			        class="cart-button">
			
			        장바구니 담기
			
			    </button>
			
			</form>
			
			<div class="product-review-link">
			
			    <a href="${pageContext.request.contextPath}/review/list?productId=${product.productId}">
			        상품 리뷰 보기
			    </a>
			
			</div>
			
        </div>
    </div>
    
</main>


<footer class="footer">

    <div class="footer-inner">

        <strong>makeit.</strong>

        <p>
            누구나 쉽게 시작하는 DIY KIT
        </p>

        <p class="copyright">
            © 2026 makeit. All rights reserved.
        </p>

    </div>

</footer>

</body>
</html>