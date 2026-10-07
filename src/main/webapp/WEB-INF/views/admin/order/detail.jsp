<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>주문 상세 - makeit.</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/main.css">

</head>

<body>

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

            </c:choose>

        </nav>

    </div>

</header>


<main class="admin-page">

    <c:if test="${not empty message}">
        <script>
            alert("${message}");
        </script>
    </c:if>


    <h2>주문 상세</h2>


    <div class="admin-order-info">

        <p>
            <strong>주문번호</strong>
            ${order.orderId}
        </p>

        <p>
            <strong>주문자</strong>
            ${order.name}
        </p>

        <p>
            <strong>아이디</strong>
            ${order.userId}
        </p>

        <p>
            <strong>주문일시</strong>
            ${order.createdAt}
        </p>

        <p>
            <strong>주문금액</strong>
            ${order.totalPrice}원
        </p>

    </div>


    <h3>주문 상품</h3>


    <table class="admin-table admin-order-items">

        <thead>

            <tr>
                <th>상품</th>
                <th>수량</th>
                <th>가격</th>
                <th>합계</th>
            </tr>

        </thead>


        <tbody>

            <c:forEach var="item"
                       items="${orderItemList}">

                <tr>

                    <td>
                        ${item.productName}
                    </td>

                    <td>
                        ${item.quantity}
                    </td>

                    <td>
                        ${item.price}원
                    </td>

                    <td>
                        ${item.totalPrice}원
                    </td>

                </tr>

            </c:forEach>

        </tbody>

    </table>


    <div class="admin-order-status">

        <h3>주문 상태 변경</h3>

        <form
            action="${pageContext.request.contextPath}/admin/order/status"
            method="post">

            <input
                type="hidden"
                name="orderId"
                value="${order.orderId}">


            <select name="orderStatus">

                <option value="주문접수"
                    ${order.orderStatus == '주문접수' ? 'selected' : ''}>
                    주문접수
                </option>

                <option value="상품준비중"
                    ${order.orderStatus == '상품준비중' ? 'selected' : ''}>
                    상품준비중
                </option>

                <option value="배송중"
                    ${order.orderStatus == '배송중' ? 'selected' : ''}>
                    배송중
                </option>

                <option value="배송완료"
                    ${order.orderStatus == '배송완료' ? 'selected' : ''}>
                    배송완료
                </option>

                <option value="주문취소"
                    ${order.orderStatus == '주문취소' ? 'selected' : ''}>
                    주문취소
                </option>

            </select>


            <button
                type="submit"
                class="admin-submit-button">

                상태 변경

            </button>

        </form>

    </div>


    <div class="admin-form-buttons">

        <a
            href="${pageContext.request.contextPath}/admin/order/list"
            class="admin-cancel-button">

            주문 목록

        </a>

    </div>

</main>

</body>
</html>