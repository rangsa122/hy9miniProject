<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 수정 - makeit.</title>

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

            <a href="${pageContext.request.contextPath}/admin/product/list">
                상품 관리
            </a>

            <a href="${pageContext.request.contextPath}/">
                홈
            </a>

            <span class="login-user">
                ${sessionScope.loginMember.name}님
            </span>

            <a href="${pageContext.request.contextPath}/member/logout">
                로그아웃
            </a>

        </nav>

    </div>

</header>


<main class="admin-page">

    <div class="admin-form-container">

        <h2>상품 수정</h2>

        <p class="admin-form-description">
            등록된 KIT 상품 정보를 수정합니다.
        </p>


        <form
            action="${pageContext.request.contextPath}/admin/product/update"
            method="post">

            <!-- 상품번호 -->
            <input
                type="hidden"
                name="productId"
                value="${product.productId}">


            <!-- 상품명 -->
            <div class="admin-form-group">

                <label for="productName">
                    상품명
                </label>

                <input
                    type="text"
                    id="productName"
                    name="productName"
                    value="${product.productName}"
                    required>

            </div>


            <!-- 카테고리 -->
            <div class="admin-form-group">

                <label for="category">
                    카테고리
                </label>

                <input
                    type="text"
                    id="category"
                    name="category"
                    value="${product.category}"
                    required>

            </div>


            <!-- 난이도 -->
            <div class="admin-form-group">

                <label for="difficulty">
                    난이도
                </label>

                <select
                    id="difficulty"
                    name="difficulty"
                    required>

                    <option value="">선택해주세요</option>

                    <option
                        value="초급"
                        ${product.difficulty == '초급' ? 'selected' : ''}>
                        초급
                    </option>

                    <option
                        value="중급"
                        ${product.difficulty == '중급' ? 'selected' : ''}>
                        중급
                    </option>

                    <option
                        value="고급"
                        ${product.difficulty == '고급' ? 'selected' : ''}>
                        고급
                    </option>

                </select>

            </div>


            <!-- 상품 설명 -->
            <div class="admin-form-group">

                <label for="description">
                    상품 설명
                </label>

                <textarea
                    id="description"
                    name="description"
                    rows="6"
                    required>${product.description}</textarea>

            </div>


            <!-- 가격 -->
            <div class="admin-form-group">

                <label for="price">
                    가격
                </label>

                <input
                    type="number"
                    id="price"
                    name="price"
                    value="${product.price}"
                    min="0"
                    required>

            </div>


            <!-- 재고 -->
            <div class="admin-form-group">

                <label for="stock">
                    재고
                </label>

                <input
                    type="number"
                    id="stock"
                    name="stock"
                    value="${product.stock}"
                    min="0"
                    required>

            </div>


            <!-- 이미지 -->
            <div class="admin-form-group">

                <label for="image">
                    이미지 경로
                </label>

                <input
                    type="text"
                    id="image"
                    name="image"
                    value="${product.image}"
                    placeholder="/images/product1.jpg">

                <p class="admin-input-help">
                    예: /images/product1.jpg
                </p>

            </div>


            <!-- 버튼 -->
            <div class="admin-form-buttons">

                <a
                    href="${pageContext.request.contextPath}/admin/product/list"
                    class="admin-cancel-button">
                    취소
                </a>

                <button
			        type="submit"
			        class="admin-submit-button">
			        저장
			    </button>

            </div>

        </form>

    </div>

</main>

</body>
</html>