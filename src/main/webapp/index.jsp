<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>s
	<h1>INDEX</h1>
	<ol>
		<li><a href="<%=request.getContextPath()%>/storeList.jsp">Store List</a></li>
		<li><a href="<%=request.getContextPath()%>/staffList.jsp">Staff List</a></li>
		<!-- view 7개 만들기 -->
		<li><a href="<%=request.getContextPath()%>/actorInfoList.jsp">actorInfo List</a></li>
		<li><a href="<%=request.getContextPath()%>/customerList.jsp">customerInfo List</a></li>
		<li><a href="<%=request.getContextPath()%>/filmList.jsp">film List</a></li>
		<li><a href="<%=request.getContextPath()%>/nicerButSlowerList.jsp">nicerButSlower List</a></li>
		<li><a href="<%=request.getContextPath()%>/salesByFilmList.jsp">salesByFilm List</a></li>
		<li><a href="<%=request.getContextPath()%>/salesByStore.jsp">salesByStore List</a></li>
		<li><a href="<%=request.getContextPath()%>/staffLIstList.jsp">staffLIst List</a></li>
	</ol>
</body>
</html> 