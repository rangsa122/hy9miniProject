<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>KIT 쇼핑 - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">
</head>

<body>

<header class="header">

    <div class="header-inner">

        <a href="${pageContext.request.contextPath}/"
           class="logo">
            makeit.
        </a>

        <nav class="nav">

            <a href="${pageContext.request.contextPath}/product/list">
                KIT 쇼핑
            </a>

            <a href="${pageContext.request.contextPath}/product/list">
                난이도별
            </a>

            <a href="${pageContext.request.contextPath}/product/list">
                재료·도구
            </a>

        </nav>

        <div class="header-right">


		<c:choose>
		
		    <%-- 관리자 로그인 상태 --%>
		    <c:when test="${not empty requestScope.loginMember and requestScope.loginMember.role eq 'ADMIN'}">
		
		        <a href="${pageContext.request.contextPath}/admin/product/list">
		            상품관리
		        </a>
		
		        <a href="${pageContext.request.contextPath}/admin/order/list">
		            주문관리
		        </a>
		
		        <a href="${pageContext.request.contextPath}/admin/member/list">
		            회원관리
		        </a>
		
		        <a href="${pageContext.request.contextPath}/member/mypage">
		            <c:out value="${requestScope.loginMember.name}" />님
		        </a>
		
		        <a href="${pageContext.request.contextPath}/member/logout">
		            로그아웃
		        </a>
		
		    </c:when>
		
		    <%-- 일반 회원 로그인 상태 --%>
		    <c:when test="${not empty requestScope.loginMember}">
		
		        <a href="${pageContext.request.contextPath}/member/mypage">
		            <c:out value="${requestScope.loginMember.name}" />님
		        </a>
		
		        <a href="${pageContext.request.contextPath}/member/logout">
		            로그아웃
		        </a>
		
		        <a href="${pageContext.request.contextPath}/cart">
		            장바구니
		        </a>
		
		    </c:when>
		
		    <%-- 비로그인 상태 --%>
		    <c:otherwise>
		
		        <a href="${pageContext.request.contextPath}/member/login">
		            로그인
		        </a>
		
		        <a href="${pageContext.request.contextPath}/member/join">
		            회원가입
		        </a>
		
		        <a href="${pageContext.request.contextPath}/cart">
		            장바구니
		        </a>
		
		    </c:otherwise>
		
		</c:choose>

        </div>

    </div>

</header>


<main class="product-list-page">

    <section class="product-section">

        <div class="section-title product-title">

            <div>

                <p>
                    ALL DIY KIT
                </p>

                <h2>
                    전체 상품
                </h2>

            </div>

        </div>


        <c:choose>

            <c:when test="${not empty productList}">

                <div class="product-grid">

                    <c:forEach var="product"
                               items="${productList}">

                        <article class="product-card">

                            <a href="${pageContext.request.contextPath}/product/detail?productId=${product.productId}">

                                <div class="product-image">

                                    <c:if test="${not empty product.image}">

                                        <img
                                            src="${pageContext.request.contextPath}${product.image}"
                                            alt="${product.productName}"
                                        >

                                    </c:if>

                                    <c:if test="${empty product.image}">

                                        <span>
                                            MAKE IT YOURSELF
                                        </span>

                                    </c:if>

                                </div>


                                <div class="product-info">

                                    <div class="product-meta">
									    <span class="product-category">
									        <c:out value="${product.category}" />
									    </span>
									
									    <c:choose>
									        <c:when test="${product.difficulty eq '초급'}">
									            <span class="difficulty-badge difficulty-beginner">
									                초급
									            </span>
									        </c:when>
									
									        <c:when test="${product.difficulty eq '중급'}">
									            <span class="difficulty-badge difficulty-intermediate">
									                중급
									            </span>
									        </c:when>
									
									        <c:when test="${product.difficulty eq '고급'}">
									            <span class="difficulty-badge difficulty-advanced">
									                고급
									            </span>
									        </c:when>
									
									        <c:otherwise>
									            <span class="difficulty-badge">
									                <c:out value="${product.difficulty}" />
									            </span>
									        </c:otherwise>
									    </c:choose>
									</div>

                                    <h3>
                                        ${product.productName}
                                    </h3>

                                    <p class="product-description">
                                        ${product.description}
                                    </p>

                                    <strong class="product-price">
									    <fmt:formatNumber value="${product.price}"
									                      type="number"
									                      groupingUsed="true"
									                      maxFractionDigits="0" />원
									</strong>

                                </div>

                            </a>

                        </article>

                    </c:forEach>

                </div>

            </c:when>


            <c:otherwise>

                <div class="empty-product">

                    <p>
                        등록된 상품이 없습니다.
                    </p>

                </div>

            </c:otherwise>

        </c:choose>

    </section>

</main>


<footer class="footer">

    <div class="footer-inner">

        <strong>
            makeit.
        </strong>

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