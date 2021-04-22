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
<title>index</title>
</head>
<!-- 출력부 View -->
<body>
	<div>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	</div>
	<!-- Best Ebook -->
	<div class="home-blog-area section-padding2">
		<div class="container">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-tittle text-center">
						<span>Top 3</span>
						<h2>BestSeller</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="m" items="${bestOrdersList}">

					<div class="col-xl-4 col-lg-4 col-md-4">
						<div class="home-blog-single mb-30">
							<div class="blog-img-cap">
								<div class="blog-img">
									<img src="${pageContext.request.contextPath}/img/${m.ebookImg}"
										alt="">
								</div>
								<div class="blog-cap">
									<p>| ${m.ebookAuthor}</p>
									<h3>
										<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">${m.ebookTitle}</a>
									</h3>
									<a href="#" class="more-btn">${m.ebookPrice} ₩</a>
								</div>
							</div>
							<div class="blog-date text-center">
								<span>Buy</span>
								<p>Now</p>
							</div>
						</div>
					</div>

				</c:forEach>


			</div>
		</div>
	</div>
	<!-- Best Ebook End -->
	<section class="blog_area section-padding">
		<div class="container">
			<!-- Section Tittle -->
			<div class="row">
				<div class="col-lg-12">
					<div class="section-tittle text-center">
						<span>Goodee</span>
						<h2>Ebook List</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 전체 -->
				<!-- 왼쪽 -->
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">
						<!-- 시작 -->
						<div class="favourite-place">
							<div class="container">
								<div class="row">
									<c:forEach var="m" items="${ebookList}">
										<div class="col-xl-4 col-lg-4 col-md-6">
											<div class="single-place mb-30">
												<div class="place-img">
													<img
														src="${pageContext.request.contextPath}/img/${m.ebookImg}"
														alt="">
												</div>
												<div class="place-cap">
													<div class="place-cap-top">
														<span><i class="fas fa-star"></i><span>${m.ebookPrice}
																₩</span> </span>
														<!-- 타이틀 -->
														<h3>
															<a
																href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">${m.ebookTitle}</a>
														</h3>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 끝 -->
					</div>
				</div>
				<!-- 왼쪽끝 -->
				<!-- 오른쪽시작 -->
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<!-- 제목검색 -->
						<aside class="single_sidebar_widget search_widget">
							<form
								action="${pageContext.request.contextPath}/SearchIndexController"
								method="post">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" name="searchWord" class="form-control"
											placeholder='Search Keyword' onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Search Title'">
										<div class="input-group-append">
											<button class="btns" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button
									class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
									type="submit">Search</button>
							</form>
						</aside>
						<!-- 카테고리별 목록을 볼수 있는 메뉴(네비게이션) -->
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Category</h4>
							<ul class="list cat-list">
								<li><a
									href="${pageContext.request.contextPath}/IndexController"
									class="d-flex"><p>ALL</p></a></li>
								<c:forEach var="ct" items="${categoryList}">
									<li><a
										href="${pageContext.request.contextPath}/IndexController?categoryName=${ct}"
										class="d-flex"><p>${ct}</p></a></li>
								</c:forEach>
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
		<!-- 오른쪽 끝 -->
		<!-- 페이징 -->
		<!-- 카테고리 페이징 -->
		<!-- 검색에 페이징 -->
		<!-- 첫번쨰 페이지는 이전버튼 비활성 -->
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:if test="${currentPage > 1}">
					<c:if test="${categoryName == null}">
						<c:if test="${serchWord == null}">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}"
								class="page-link" aria-label="Previous"><i
									class="ti-angle-left"></i></a></li>
							</li>
						</c:if>
						<c:if test="${serchWord != null}">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/SearchIndexController?currentPage=${currentPage-1}&searchWord=${searchWord}"
								class="page-link" aria-label="Previous"><i
								class="ti-angle-left"></i></a>
							</li>
						</c:if>
					</c:if>
					<c:if test="${categoryName != null}">
						<li class="page-item"><a
							href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage-1}&categoryName=${categoryName}"
							class="page-link" aria-label="Previous"><i
							class="ti-angle-left"></i></a>
						</li>
					</c:if>
				</c:if>
				<!-- 마지막 페이지는 다음버튼 비활성 -->
				<c:if test="${currentPage < lastPage}">
					<c:if test="${categoryName == null}">
						<c:if test="${serchWord == null}">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}"
								class="page-link" aria-label="Next"><i
								class="ti-angle-right"></i></a>
						</c:if>
						<c:if test="${serchWord != null}">
							<li class="page-item"><a
								href="${pageContext.request.contextPath}/SearchIndexController?currentPage=${currentPage+1}&searchWord=${searchWord}"
								class="page-link" aria-label="Next"><i
								class="ti-angle-right"></i></a>
						</c:if>
					</c:if>
					<c:if test="${categoryName != null}">
						<li class="page-item"><a
							href="${pageContext.request.contextPath}/IndexController?currentPage=${currentPage+1}&categoryName=${categoryName}"
							class="page-link" aria-label="Next"><i class="ti-angle-right"></i></a>
					</c:if>
				</c:if>
			</ul>
		</nav>
	</section>
	<!-- footer include -->
	<div>
		<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	</div>
</body>
</html>