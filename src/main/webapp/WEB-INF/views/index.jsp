<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body>
   <nav class="nav">
           <ul>
               <li>Soft</li>
                <li><a href="<%= cp %>/search.action">Search</a></li>
                <li><a href="<%= cp %>/created.action" >Input</a></li>
                <li><a href="<%= cp %>/index.do">Home</a></li>
           </ul>
       </nav>
    <div class="container">
        <p>인사관리 시스템</p>
        <p>인사 정보 입력 <a  href="<%= cp %>/created.action"  class="click">입력</a></p>
        <p>인사 정보 조회 <a  href="<%= cp %>/search.action" class="click">조회</a></p>
    </div>
</body>
</html>