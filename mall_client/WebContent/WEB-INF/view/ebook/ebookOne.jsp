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
	<!-- 상단메뉴 네비게이션 -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	</div>
	<div class="container">
		<!-- Section Tittle -->
		<div class="row">
			<div class="col-lg-12">
				<div class="section-tittle text-center">
					<span>Goodee</span>
					<h2>Ebook One</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="support-company-area servic-padding fix">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-xl-6 col-lg-6">
					<div class="support-location-img mb-50">
						<img
							src="${pageContext.request.contextPath}/img/${ebook.ebookImg}"
							alt=""> <span></span>
						<div class="support-img-cap">
							<span>${ebook.ebookState}</span>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6">
					<div class="right-caption">
						<!-- Section Tittle -->
						<div class="section-tittle section-tittle2">
							<h2>${ebook.ebookTitle}</h2>
							<h4>${ebook.ebookCompany}
								/
								${ebook.ebookAuthor}</h4>
						</div>
						<div class="support-caption">
							<p>${ebook.ebookSummary}</p>
							<div class="section-tittle section-tittle2">
								<span>
									<table>
										<tr>
											<td>date</td>
											<td>: ${ebook.ebookDate.substring(0, 10)}</td>
										</tr>
										<tr>
											<td>ISBN</td>
											<td>: ${ebook.ebookISBN}</td>
										</tr>
										<tr>
											<td>No</td>
											<td>: ${ebook.ebookNo}</td>
										</tr>
										<tr>
											<td>Category</td>
											<td>: ${ebook.categoryName}</td>
										</tr>
										<tr>
											<td>Page</td>
											<td>: ${ebook.ebookPageCount}</td>
										</tr>
										<tr>
											<td>Price</td>
											<td>: ${ebook.ebookPrice}₩
											</td>
										</tr>
									</table>
								</span>
							</div>
							<br>
							<!-- InsertCartController?ebookNo - CartDao.insertCart() - redirect:CartListController -->
							<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
							<c:if test="${loginClient == null 
								|| ebook.ebookState == '품절' 
								|| ebook.ebookState == '절판' 
								|| ebook.ebookState == '구편절판'}">
								<button type="button" disabled="disabled" class="btn border-btn">Buy Now!</button>
							</c:if>
							<c:if test="${loginClient != null}">
								<button type="button" class="btn border-btn">Buy Now!</button>
							</c:if>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>