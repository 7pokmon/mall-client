<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 상단 메인 메뉴 -->
<!-- 로그아웃일때  -->
<c:if test="${loginClient == null}">
    <header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>today : ${statsCount}</li>
                                    <li>total : ${total}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">    
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                   <li> <a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
                
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${pageContext.request.contextPath}/IndexController">Home</a></li>
                                            <li><a href="${pageContext.request.contextPath}/EbookCalendarController">Calender</a></li>
                                            <li><a href="${pageContext.request.contextPath}/InsertClientController">Sign up</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    	<main>
		<div class="slider-area ">
			<!-- Mobile Menu -->
			<div class="slider-active">
				<div
					data-background="${pageContext.request.contextPath}/assets/img/hero/h1_hero.jpg"
					class="single-slider hero-overly  slider-height d-flex align-items-center">
					<div class="container">
						<div class="row">
							<div class="col-xl-9 col-lg-9 col-md-9">
								<div class="hero__caption">
									<h1>
										Mall <span>Index</span>
									</h1>
									<p>Hello</p>
								</div>
							</div>
						</div>
						<!-- Search Box -->
						<div class="row">
							<div class="col-xl-12">
								<!-- form -->

								<div class="row">
									<div class="col-lg-8 col-md-8">
										<form
											action="${pageContext.request.contextPath}/LoginController"
											method="post">
											<div class="mt-10">
												<input type="text" name="clientMail"
													placeholder="enter your ID" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'enter your ID'" required
													class="single-input">
											</div>
											<div class="mt-10">
												<input type="password" name="clientPw"
													placeholder="enter your Password"
													onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'enter your Password'" required
													class="single-input">
											</div>
											<div class="button-group-area mt-40">
												<button type="submit"
													class="genric-btn warning circle arrow">
													Login<span class="lnr lnr-arrow-right"></span>
												</button>
											</div>

										</form>
										<!-- Button trigger modal -->

									</div>

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>	
</c:if>

<c:if test="${loginClient != null}">
	<header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>today : ${statsCount}</li>
                                    <li>total : ${total}</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">    
                                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                   <li> <a href="#"><i class="fab fa-pinterest-p"></i></a></li>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
                
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${pageContext.request.contextPath}/IndexController">Home</a></li>
                                            <li><a href="${pageContext.request.contextPath}/ClientOneController">Profile</a></li>
                                            <li><a href="${pageContext.request.contextPath}/CartListController">CartList</a></li>
                                            <li><a href="${pageContext.request.contextPath}/OrdersListController">OrderList</a></li>
                                            <li><a href="${pageContext.request.contextPath}/EbookCalendarController">Calender</a></li>
                                            <li><a href="${pageContext.request.contextPath}/LogoutController">LogOut</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
</c:if>
