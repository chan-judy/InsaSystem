<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<!-- 제이쿼리 _순서변경X-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/search.js"></script>


<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/search.css">

</head>

<body>
	<form action="#"  id="searchForm">
		<nav class="nav">
			<ul>
				<li>Soft</li>
				<li><a href="<%=cp%>/search.action">Search</a></li>
				<li><a href="<%=cp%>/created.action">Input</a></li>
				<li><a href="<%=cp%>/index.do">Home</a></li>
			</ul>
		</nav>

		<input type="hidden" id="pageNum" name="pageNum" name="pageNum" value="${pageNum}" />
		<input type="hidden" id="searchOption" name="searchOption" name="searchOption"
			value="${searchOption}" />


		<table class="searchtable">
			<tr>
				<th>사번</th>
				<td><input type="text" id="s_sabun"   value="${search.s_sabun }"></td>
				<th>사원명</th>
				<td><input type="text" id="s_name"  value="${search.s_name }"></td>
				<th>입사구분</th>
				<td><select id="s_join_gbn"  >
						<option value="">★★선택 ★★</option>
						<c:forEach var="i" items="${common.join}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>투입여부</th>
				<td colspan="2"><select id="s_put_yn" >
						<option value="">★★선택 ★★</option>
						<c:forEach var="i" items="${common.putYn}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<th>직위</th>
				<td><select id="s_pos_gbn"  >
						<option value="">★★선택 ★★</option>
						<c:forEach var="i" items="${common.pos}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>입사일</th>
				<td><input type="date" id="s_join_day"  value="${search.s_join_day }"></td>
				<th>퇴사일</th>
				<td><input type="date" id="s_retire_day" value="${search.s_retire_day }"></td>
				<th>직종</th>
				<td><select id="s_job_type" >
						<option value="">★★선택 ★★</option>
						<c:forEach var="i" items="${common.jobType}" varStatus="status" >
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<div class="btn1">
			<button type="button" id="searchBtn">검색</button>
			<button type="button"  id="deleteBtn">삭제</button>
			<button type="reset">초기화</button>
			<button type="button" id="backBtn" onclick="window.history.back()">이전</button>
		</div>

		<table class="search_list" id="search_list">
			<thead>
				<tr>
					<th colspan="" class=""></th>
					<th colspan="" class="sabun">사번</th>
					<th class="name">성명</th>
					<th class="reg_no">주민번호</th>
					<th class="hp">HP</th>
					<th class="pos_gbn_code">직위</th>
					<th class="join_day">입사일자</th>
					<th class="retire_day">퇴사일자</th>
					<th class="put_yn">투입여부</th>
					<th class="salary">연봉</th>
				</tr>
			</thead>

			<tbody id="insaList">
				<c:if test="${empty insaList }">
				</c:if>
			</tbody>
		</table>
		<div id="prenext">
		
		</div>

	</form>
</body>
</html>