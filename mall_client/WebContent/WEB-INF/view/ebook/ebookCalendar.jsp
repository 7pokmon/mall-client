<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="${pageContext.request.contextPath}/assets/img/hero/about.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>Ebook Calendar</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="sample-text-area">
		<div class="container box_1170">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-tittle text-center">
						<span><a href="${pageContext.request.contextPath}/EbookCalendarController">Set</a></span>
						<h2>
							<a
								href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">
								<- </a> ${currentYear}년 ${currentMonth}월 <a
								href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">
								-> </a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
			<table border="1" class="container">
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
				<tr>
					<c:forEach var="i" begin="1" end="${endDay+(firstDayOfWeek-1)}"
						step="1">
						<c:if test="${(i-(firstDayOfWeek-1)) <= 0}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${(i-(firstDayOfWeek-1)) > 0}">
							<td>
								<div>${i-(firstDayOfWeek-1)}</div> <c:forEach var="m"
									items="${ebookListByMonth}">
									<c:if test="${(i-(firstDayOfWeek-1)) == m.d}">
										<div>
												<a
													href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}"
													class="genric-btn link-border circle"> <c:if
														test="${m.ebookTitle.length() > 10}">
                                    ${m.ebookTitle.substring(0, 10)}...
                                 </c:if> <c:if
														test="${m.ebookTitle.length() <= 10}">
                                 	${m.ebookTitle}
                                 </c:if>
												</a>
											</div>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
				</tr>
				<tr>
					</c:if>
					</c:forEach>
					<!-- 공백 + endDay 만큼 td가 필요 -->
					<c:if test="${(endDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7-((endDay+(firstDayOfWeek-1))%7)}"
							step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</table>

	<!-- footer include -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>