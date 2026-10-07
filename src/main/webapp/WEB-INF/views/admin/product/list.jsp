<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>상품 관리 - makeit.</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/main.css">

</head>

<body>

	<c:if test="${not empty message}">
	    <script>
	        alert("${message}");
	    </script>
	</c:if>
	
	<c:if test="${not empty error}">
	    <script>
	        alert("${error}");
	    </script>
	</c:if>

<header class="site-header">

    <div class="header-inner">

        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/">
                makeit.
            </a>
        </h1>

        <nav class="header-nav">

            <a href="${pageContext.request.contextPath}/">
                홈
            </a>

            <a href="${pageContext.request.contextPath}/admin/product/list">
		        상품 관리
		    </a>
		
		    <a href="${pageContext.request.contextPath}/admin/order/list">
		        주문 관리
		    </a>
		    
		    <a href="${pageContext.request.contextPath}/admin/member/list">
			    회원 관리
			</a>

            <c:choose>

                <c:when test="${not empty sessionScope.loginMember}">

                    <span class="login-user">
                        ${sessionScope.loginMember.name}님
                    </span>

                    <a href="${pageContext.request.contextPath}/member/logout">
                        로그아웃
                    </a>

                </c:when>

                <c:otherwise>

                    <a href="${pageContext.request.contextPath}/member/login">
                        로그인
                    </a>

                    <a href="${pageContext.request.contextPath}/member/join">
                        회원가입
                    </a>

                </c:otherwise>

            </c:choose>

        </nav>

    </div>

</header>


<main class="admin-page">

    <div class="admin-container">

        <div class="admin-title-area">

            <div>
                <h2>상품 관리</h2>

                <p>
                    makeit. 상품을 관리합니다.
                </p>
            </div>

            <a
			    href="${pageContext.request.contextPath}/admin/product/write"
			    class="admin-add-button">
			
			    상품 등록
			
			</a>

        </div>


        <div class="admin-product-list">

            <table>

                <thead>

                    <tr>
                        <th>상품번호</th>
                        <th>상품명</th>
                        <th>카테고리</th>
                        <th>난이도</th>
                        <th>가격</th>
                        <th>재고</th>
                        <th>관리</th>
                    </tr>

                </thead>


                <tbody>

                    <c:forEach
                        var="product"
                        items="${productList}">

                        <tr>

                            <td>
                                ${product.productId}
                            </td>

                            <td class="admin-product-name">

                                <c:if test="${not empty product.image}">
                                    <img
                                        src="${pageContext.request.contextPath}${product.image}"
                                        alt="${product.productName}">
                                </c:if>

                                <span>
                                    ${product.productName}
                                </span>

                            </td>

                            <td>
                                ${product.category}
                            </td>

                            <td>
                                ${product.difficulty}
                            </td>

                            <td>
                                ${product.price}원
                            </td>

                            <td>
                                ${product.stock}
                            </td>

                            <td>

                                <a
								    href="${pageContext.request.contextPath}/admin/product/edit?productId=${product.productId}"
								    class="admin-edit-button">
								    수정
								</a>

                                <form
								    action="${pageContext.request.contextPath}/admin/product/delete"
								    method="post"
								    style="display: inline;"
								    onsubmit="return confirm('이 상품을 삭제하시겠습니까?');">
								
								    <input
								        type="hidden"
								        name="productId"
								        value="${product.productId}">
								
								    <button
								        type="submit"
								        class="admin-delete-button">
								        삭제
								    </button>
								
								</form>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</main>

</body>
</html>