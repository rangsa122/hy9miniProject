<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>상품 등록 - makeit.</title>

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

        <h2>상품 등록</h2>

        <p class="admin-form-description">
            새로운 KIT 상품을 등록합니다.
        </p>


        <form
            action="${pageContext.request.contextPath}/admin/product/add"
            method="post">


            <div class="admin-form-group">

                <label for="productName">
                    상품명
                </label>

                <input
                    type="text"
                    id="productName"
                    name="productName"
                    required>

            </div>


            <div class="admin-form-group">

                <label for="category">
                    카테고리
                </label>

                <input
                    type="text"
                    id="category"
                    name="category"
                    placeholder="예: 뜨개질"
                    required>

            </div>


            <div class="admin-form-group">

                <label for="difficulty">
                    난이도
                </label>

                <select
                    id="difficulty"
                    name="difficulty"
                    required>

                    <option value="">
                        선택해주세요
                    </option>

                    <option value="초급">
                        초급
                    </option>

                    <option value="중급">
                        중급
                    </option>

                    <option value="고급">
                        고급
                    </option>

                </select>

            </div>


            <div class="admin-form-group">

                <label for="description">
                    상품 설명
                </label>

                <textarea
                    id="description"
                    name="description"
                    rows="6"
                    required></textarea>

            </div>


            <div class="admin-form-group">

                <label for="price">
                    가격
                </label>

                <input
                    type="number"
                    id="price"
                    name="price"
                    min="0"
                    required>

            </div>


            <div class="admin-form-group">

                <label for="stock">
                    재고
                </label>

                <input
                    type="number"
                    id="stock"
                    name="stock"
                    min="0"
                    required>

            </div>


            <div class="admin-form-group">

                <label for="image">
                    이미지 경로
                </label>

                <input
                    type="text"
                    id="image"
                    name="image"
                    placeholder="/images/product5.jpg">

                <p class="admin-input-help">
                    예: /images/product5.jpg
                </p>

            </div>


            <div class="admin-form-buttons">

                <a
                    href="${pageContext.request.contextPath}/admin/product/list"
                    class="admin-cancel-button">
                    취소
                </a>

                <button
                    type="submit"
                    class="admin-submit-button">
                    상품 등록
                </button>

            </div>


        </form>

    </div>

</main>

</body>
</html>