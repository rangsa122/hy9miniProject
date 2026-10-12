<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"
    uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>장바구니 - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

    <style>

        .cart-container {
            max-width: 1100px;
            margin: 80px auto;
            padding: 0 40px;
        }

        .cart-container h1 {
            margin-bottom: 40px;
        }

        .cart-item {
            display: grid;
            grid-template-columns: 140px 1fr 120px 100px 100px;
            gap: 20px;
            align-items: center;
            padding: 25px 0;
            border-bottom: 1px solid #ddd;
        }

        .cart-image {
            width: 140px;
            height: 140px;
            background: #f5f2ed;
        }

        .cart-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .cart-product-name {
            font-weight: bold;
        }

        .cart-price {
            font-weight: bold;
        }

        .quantity-form {
            display: flex;
            gap: 5px;
        }

        .quantity-form input {
            width: 50px;
            padding: 8px;
            text-align: center;
        }

        .quantity-form button,
        .delete-button {
            padding: 8px;
            border: 1px solid #ddd;
            background: white;
            cursor: pointer;
        }

        .cart-summary {
            margin-top: 40px;
            text-align: right;
        }

        .cart-total {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .order-button {
            padding: 16px 50px;
            background: #111;
            color: white;
            border: none;
            cursor: pointer;
        }

        .empty-cart {
            padding: 100px 0;
            text-align: center;
            color: #888;
        }

    </style>

</head>


<body>


<header class="header">

    <div class="header-inner">

        <a href="/" class="logo">
            makeit.
        </a>

        <nav class="nav">

            <a href="/">
                KIT 쇼핑
            </a>

            <a href="#">
                난이도별
            </a>

            <a href="#">
                재료·도구
            </a>

        </nav>

        <div class="header-right">

            <a href="/">
                메인
            </a>

            <a href="/member/logout">
                로그아웃
            </a>

        </div>

    </div>

</header>


<main>

    <div class="cart-container">

        <h1>장바구니</h1>


        <c:choose>


            <c:when test="${empty cartItems}">

                <div class="empty-cart">

                    <h2>
                        장바구니가 비어있어요.
                    </h2>

                    <p>
                        마음에 드는 KIT를 담아보세요.
                    </p>

                    <br>

                    <a href="/">
                        상품 보러가기
                    </a>

                </div>

            </c:when>


            <c:otherwise>


                <c:set
                    var="totalPrice"
                    value="0"
                />


                <c:forEach
                    var="item"
                    items="${cartItems}">

                    <div class="cart-item">


                        <div class="cart-image">

                            <img
                                src="${pageContext.request.contextPath}${item.image}"
                                alt="${item.productName}"
                            >

                        </div>


                        <div>

                            <p class="cart-product-name">
                                ${item.productName}
                            </p>

                            <p>
                                ${item.price}원
                            </p>

                        </div>


                        <div>
						
						    <form
						        class="quantity-form"
						        action="${pageContext.request.contextPath}/cart/update"
						        method="post">
						
						        <input
						            type="hidden"
						            name="cartItemId"
						            value="${item.cartItemId}"
						        >
						
						        <input
						            type="number"
						            name="quantity"
						            value="${item.quantity}"
						            min="1"
						            max="${item.stock}"
						        >
						
						        <button type="submit">
						            변경
						        </button>
						
						    </form>
						
						</div>


                        <div class="cart-price">

                            ${item.totalPrice}원

                        </div>


                        <div>

                            <form
                                action="${pageContext.request.contextPath}/cart/delete"
                                method="post">

                                <input
                                    type="hidden"
                                    name="cartItemId"
                                    value="${item.cartItemId}"
                                >

                                <button
                                    class="delete-button"
                                    type="submit">

                                    삭제

                                </button>

                            </form>

                        </div>


                    </div>


                    <c:set
                        var="totalPrice"
                        value="${totalPrice + item.totalPrice}"
                    />


                </c:forEach>


                <div class="cart-summary">
				    <p>
				        총 상품 금액
				    </p>
				
				    <div class="cart-total">
				        ${totalPrice}원
				    </div>
				
				    <form
				        action="${pageContext.request.contextPath}/order/create"
				        method="post">
				
				        <button
				            type="submit"
				            class="order-button">
				            주문하기
				        </button>
				
				    </form>
				</div>


            </c:otherwise>

        </c:choose>


    </div>

</main>


</body>

</html>