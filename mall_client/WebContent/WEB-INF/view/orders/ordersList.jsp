<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Travel HTML-5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<!-- CSS here -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slicknav.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/animate.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/responsive.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인메뉴상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 주문리스트 -->
	<div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${pageContext.request.contextPath}/assets/img/hero/about.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>OrderList</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>
<div class="table-responsive">	
	<table class="table">
		<tr>
			<td>ordersNo</td>
			<td>ebookNo</td>
			<td>ordersDate</td>
			<td>ordersState</td>
			<td>ebookTitle</td>
			<td>ebookPrice</td>
		</tr>
		<c:forEach var="m" items="${ordersList}">
		<tr>
			<td>${m.ordersNo}</td>
			<td>${m.ebookNo}</td>
			<td>${m.ordersDate}</td>
			<td>${m.ordersState}</td>
			<td>${m.ebookTitle}</td>
			<td>${m.ebookPrice}</td>
		</tr>
		</c:forEach>
	</table>
</div>	
	<!-- 페이징 -->
	<!-- 첫페이지 이전버튼 비활성 -->
	<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
	<c:if test="${currentPage > 1}"> 
		<li class="page-item"><a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage - 1}" class="page-link" aria-label="Previous"><i class="ti-angle-left"></i></a>
	</c:if>
	<!-- 마지막페이지 다음버튼 비활성 -->
	<c:if test="${currentPage < lastPage}">
		<li class="page-item"><a href="${pageContext.request.contextPath}/OrdersListController?currentPage=${currentPage + 1}" class="page-link" aria-label="Next"><i class="ti-angle-right"></i></a>
	</c:if>
			</ul>
	</nav>			
	<!-- footer include -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>