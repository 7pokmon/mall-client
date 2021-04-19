<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 메인메뉴 상단 -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<%
		List<Map<String, Object>> ebookListByMonth = (List<Map<String, Object>>)request.getAttribute("ebookListByMonth");
		int currentYear = (Integer)request.getAttribute("currentYear");
		int currentMonth = (Integer)request.getAttribute("currentMonth");
		int endDay = (Integer)request.getAttribute("endDay");
		int firstDayOfWeek = (Integer)request.getAttribute("firstDayOfWeek");
		
		// 이전달 다음달
		
		int preYear = currentYear;
		int preMonth = currentMonth - 1;
		if(preMonth == 0) {
			preMonth = 12;
			preYear -= 1;
		}
		System.out.println(preYear+"preYear");
		System.out.println(preMonth+"preMonth");
		
		int nextYear = currentYear;
		int nextMonth = currentMonth + 1;
		if(nextMonth == 13) {
			nextMonth = 1;
			nextYear += 1;
		}
		
	%>
	<h1>Ebook Calendar</h1>
	<!-- 달력이동 -->
	<div>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=preYear%>&currentMonth=<%=preMonth%>">이전달</a>
		<span><%=currentYear%>년</span>
		<span><%=currentMonth%>월</span>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=nextYear%>&currentMonth=<%=nextMonth%>">다음달</a>
	</div>
	<!-- 캘린더 -->
	<!-- N행 7열 -->
	<table border="1">
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
<%
         for(int i=1; i<firstDayOfWeek; i++){
%>
            <td></td>
<%
         }
         for(int i=1; i<=endDay; i++){
%>            
            <td>
            	<%=i %>
            	<%
            		for(Map m : ebookListByMonth) {
            			if(i == (Integer)m.get("d")) {
            	%>
                    		<div><a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
                <%    		
                			// ebookTitle 10글자 이상일시 ...처리
                    		String ebookTitle = (String)m.get("ebookTitle");
                    		if(ebookTitle.length() > 10) {
                %>
                			<%=ebookTitle.substring(0, 10)%>...</a></div>
                <%
                    		} else {
                %>
                			<%=ebookTitle%></a></div>
                <%  			
                    		}
            			}
            		}
            	%>
            </td>
<%
            if(firstDayOfWeek%7==0){
%>               
            </tr><tr>
<%               
            }
            firstDayOfWeek += 1;
         }
         firstDayOfWeek -= 1;
         if((firstDayOfWeek%7) != 0){
            for(int i=1; i<=7-(firstDayOfWeek%7); i++){
%>               

            <td></td>
<%               
            }
         }
%>
      </tr>
   </table>
</body>
</html>