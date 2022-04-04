<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import ="dao.ActorInfoDao" %>
<%@ page import ="vo.ActorInfo" %>
<%@ page import ="java.util.*" %>
<%
	int currentPage = 1; // 현재 페이지 초기 값 1
	if(request.getParameter("currentPage")!=null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		System.out.println(currentPage+"<--currentPage");
	}
	int rowPerPage = 5; 
	if(request.getParameter("rowPerPage")!=null){
		rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		System.out.println(rowPerPage+"<--rowPerPage");
	}
	int beginRow = (currentPage-1)*rowPerPage; //Page 처음 행의 값 연산식
		System.out.println(beginRow+"beginRow");
	int minPage = 1;
		if(request.getParameter("minPage")!= null){
			minPage = Integer.parseInt(request.getParameter("minPage"));
			currentPage=minPage;
		}else{
			minPage = (currentPage-1)/10*10+1;//페이징에 표시 될 가장 작은 페이지숫자 :일의 자리수는 1이고, 십이상의 자리수는 currentPage와 동일한 minPage
		}
		System.out.println(minPage+"<--minPage");
	//전체행 변수 초기화
	int totalRow =0; 
	//마지막 페이지 변수 초기화
	int lastPage = 0; 
	//ActorInfoDao 호출
	List<ActorInfo> list = new ArrayList<ActorInfo>();
	ActorInfoDao actorInforDao = new ActorInfoDao();
	list = actorInforDao.selectActorInfoListByPage(beginRow, rowPerPage);
	totalRow = actorInforDao.Row();
	System.out.println(totalRow+"<-totalRow");
	//연산식
	lastPage = ((totalRow - 1) / rowPerPage + 1); //마지막 페이지를 구하는 연산식
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<title>ActorInfoList</title>
</head>
<body class = "container">
	<h1 class="display-4">ActorInfoList</h1>
	<a href="<%=request.getContextPath()%>/index.jsp" >index</a>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="alert alert-dark" role="alert">ActorId</th>
				<th class="alert alert-dark" role="alert">firstName</th>
				<th class="alert alert-dark" role="alert">lastName</th>
				<th class="alert alert-dark" role="alert">filmInfo</th>
			</tr>
		<tbody>
				<%
					for(ActorInfo a : list){
				%>
			<tr>
				<td class="alert alert-primary"><%=a.getActorId()%></td>
				<td class="alert alert-primary"><%=a.getFirstName()%></td>	
				<td class="alert alert-primary"><%=a.getLastName()%></td>
				<td class="alert alert-primary"><%=a.getFilmInfo()%></td>
			</tr>
				<%
					}
				 %>
		</tbody>
	</table>
	<!-- 페이지 목록 표시 부분 -->
	<form method="post" action = "<%=request.getContextPath()%>/ActorInfoList.jsp" >
		<!-- 이전 목록 표시 -->
		<%
			if(minPage > 10){
		 %>
		 		<button type = "submit" value ="<%=minPage-10%>" name = "minPage" class="btn btn-outline-info" >이전목록</button>
		 <%
			}
		 %>
		<!-- 이전 부분 -->
		<%
			if(currentPage>1){
		%>
		 		<button type = "submit" value ="<%=currentPage-1%>" name = "currentPage" class="btn btn-outline-dark" >이전</button>
		<%
			}
		%>
		<!-- 목록 사이 번호 표시 -->
		<%
			for(int i = minPage; i<minPage+10; i=i+1){
				if(i<=lastPage){
					if(currentPage==i){
		%>
					<button type = "submit" value ="<%=i%>" name = "currentPage" class="btn btn-outline-dark"><%=i%></button>
		<%
					}else{
		%>
					<button type = "submit" value ="<%=i%>" name = "currentPage" class="btn btn-outline-dark"><%=i%></button>
		<%
					}
				}
			}	
		%>
		<!-- 다음 부분 -->
		<%
			if(currentPage<lastPage){
		%>
	 		<button type = "submit" value ="<%=currentPage+1%>" name = "currentPage" class="btn btn-outline-dark" >다음</button>
		<%
			}
		%>
		<!-- 다음목록 표시 -->
		<%
			if(minPage+10<=lastPage){
		 %>
		 		<button type = "submit" value ="<%=minPage+10%>" name = "minPage" class="btn btn-outline-dark">다음목록</button>
		 <%
			}
		 %>
		</form>	
</body>
</html> 