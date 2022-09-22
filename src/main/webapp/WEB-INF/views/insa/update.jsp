<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script type="text/javascript" src="resources/js/update.js"></script>

<!-- 다음 주소 API -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/address_api.js"></script>


<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/update.css">


<!-- 파일 미리보기를 위한 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>


</head>
<body>
	<form action="#" id="updatedForm" method="POST" enctype="multipart/form-data">
		<nav class="nav">
			<ul>
				<li>Soft</li>
				<li><a href="<%=cp%>/search.action">Search</a></li>
				<li><a href="<%= cp %>/created.action">Input</a></li>
				<li><a href="<%= cp %>/index.do">Home</a></li>
			</ul>
		</nav>
		
		<div class="topbutton">
			<button type="submit"  id="insert">수정</button>
			<button type="reset"  id="reset">초기화</button>
			<button type="button" id="backBtn" onclick="window.history.back()">이전</button>
		</div>

		<input type="hidden" id="select-joinGbnCode" value="${insa.join_gbn_code }"/>
		<input type="hidden" id="select-sex" value="${insa.sex }"/>
		<input type="hidden" id="select-posGbnCode" value="${insa.pos_gbn_code }"/>
		<input type="hidden" id="select-deptCode" value="${insa.dept_code }"/>
		<input type="hidden" id="select-jobType" value="${insa.job_type }"/>
		<input type="hidden" id="select-putYn" value="${insa.put_yn }"/>
		<input type="hidden" id="select-gartLevel" value="${insa.gart_level }"/>
		<input type="hidden" id="select-milYn" value="${insa.mil_yn }"/>
		<input type="hidden" id="select-milType" value="${insa.mil_type }"/>
		<input type="hidden" id="select-milLevel" value="${insa.mil_level }"/>
		<input type="hidden" id="select-kosaRegYn" value="${insa.kosa_reg_yn }"/>
		<input type="hidden" id="select-kosaClassCode" value="${insa.kosa_class_code }"/>
		
		<input type="hidden" id="s_sabun" name="s_sabun" value="${search.s_sabun }">
		<input type="hidden" id="s_name" name="s_name" value="${search.s_name }">
		<input type="hidden" id="s_join_gbn" name="s_join_gbn" value="${search.s_join_gbn }">
		<input type="hidden" id="s_put_yn" name="s_put_yn" value="${search.s_put_yn }">
		<input type="hidden" id="s_pos_gbn" name="s_pos_gbn" value="${search.s_pos_gbn }">
		<input type="hidden" id="s_job_type" name="s_job_type" value="${search.s_job_type }">
		<input type="hidden" id="s_join_day" name="s_join_day" value="${search.s_join_day }">
		<input type="hidden" id="s_retire_day" name="s_retire_day" value="${search.s_retire_day }">
		<input type="hidden" id="pageNum" name="pageNum" value="${pageNum }">
		<input type="hidden" id="searchOption" name="searchOption" value="${searchOption }">

		<table>
			<tr>
				<th colspan="2" rowspan="5">
					<div class="img">
						<c:if test="${empty insa.profile }">
						<input type="image"  src="resources/assets/profile.png"  alt="프로필사진" id="profile_image" class="profile" >
						</c:if>
						<c:if test="${not empty insa.profile }">
						<input type="image"  src="resources/upload/${insa.profile }" id="profile_image" class="profile" >
						</c:if>
					</div>
				</th>
				<th>*사번</th>
				<td><input type='text' placeholder='자동생성' readonly="readonly"  name="sabun" value="${insa.sabun }"></td>
				<th>*사원명</th>
				<td colspan="2"><input type="text" size="10" maxlength="10"
					name="name" id="name"  value="${insa.name }"></td>
				<th>영문이름</th>
				<td colspan="2"><input type="text" size="50" maxlength="30"
					name="eng_name" id="eng_name"  value="${insa.eng_name }"></td>
			</tr>
			<tr>
				<th>*아이디</th>
				<td><input type="text" size="50" maxlength="50" name="id"
					id="id"  value="${insa.id }">&nbsp;
					<button type="button" class="idchk_button"  id="idChk">중복확인</button>
					<span id="resultId"></span> <input type="hidden" value="true"
					id="chkEnd"></td>
				<th>*비밀번호</th>
				<td colspan="2"><input type="password" size="50" maxlength="50"
					name="pwd" id="pwd1"  value="${insa.pwd }"></td>
				<th>*비밀번호 확인</th>
				<td colspan="3"><input type="password"  size="50" maxlength="50"  id="pwd2">
					<button type="button" class="pwdchk_button"  id="pwdChk">중복확인</button>
					</td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td><input type="text" size="13" maxlength="13"
					placeholder=' - 제외하고 입력하세요' class="phone" name="phone"  value="${insa.phone }"></td>
				<th>*휴대폰번호</th>
				<td colspan="2"><input type="text" size="13" maxlength="13"
					placeholder=' - 제외하고 입력하세요' name="hp" id="hp" class="hp"  value="${insa.hp }"></td>
				<th>*주민등록번호</th>
				<td colspan="3"><input type="text" size="14" maxlength="14"
					placeholder=' - 제외하고 입력하세요' name="reg_no" class="reg_no"
					id="reg_no"  value="${insa.reg_no }"> 
				
					</td>
			</tr>

			<tr>
				<th>*이메일</th>
				<td class="mail"><input type="text" name="email1" id="email1"  value="${email1}">
					@ <input type='text' class="mail_addr" id="email2" name="email2" >
					<select name='Emailselect'>
						<option value="selected">★선택★</option>
						<option value='etc'>직접입력</option>
						<option value='naver.com'>naver.com</option>
						<option value='daum.net'>daum.net</option>
						<option value='nate.com'>nate.com</option>
						<option value='gmail'>gmail.com</option>
				</select> <input type="hidden" id="email" name="email" /></td>

				<th>직종</th>
				<td><select name='job_type'>
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.jobType}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>연령</th>
				<td><input type='text' name="years" placeholder="자동생성"
					readonly="readonly" class="years" id="years"></td>
				<th>성별</th>
				<td><input type='text' readonly="readonly" name="sex" id="sex"
					class="sex" placeholder="자동생성"></td>
			</tr>

			<tr>
				<th>주소</th>
				<td colspan="7">
					<button type="button" class="addrbutton" onclick="execPostCode();">주소검색</button>
					<input type='text' class="zip" name="zip" placeholder="자동생성"	readonly="readonly" value="${insa.zip }">
					 <input type='text' readonly="readonly"	placeholder='주소' class="addr1" name="addr1" value="${insa.sabun }">
					 <input type='text' placeholder='세부 주소' name="addr2" class="addr2" value="${insa.sabun }">
				</td>
			</tr>

			<tr>
				<th colspan="2">
					<label class="profile_button"  for="profile">사진올리기</label>
					<input type="file" id="profile" name="profile1"  />
				</th>
				
				<th>직위</th>
				<td><select name="pos_gbn_code">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.pos}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>부서</th>
				<td colspan="2"><select name="dept_code">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.dept}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>연봉</th>
				<td colspan="3"><input type="text" name="salary" value=" (만원) "  class="salary" id="salary" value="${insa.salary }"></td>
			</tr>
			<tr>
				<th>입사구분</th>
				<td><select name="join_gbn_code">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.join}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>최종학력</th>
				<td><select name="gart_level">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.gartLevel}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>투입여부</th>
				<td colspan="2"><select name="put_yn">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.putYn}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>군필여부</th>
				<td colspan="3"><select name="mil_yn">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.milYn}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
			</tr>

			<tr>
				<th>군별</th>
				<td><select name="mil_type">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.milType}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>계급</th>
				<td><select name="mil_level">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.milLevel}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>입영일</th>
				<td colspan="2"><input type="date" name="mil_startdate" class="mil_startdate" value="${insa.mil_startdate }"></td>
				<th>전역일</th>
				<td colspan="3"><input type="date" name="mil_enddate" class="mil_enddate" value="${insa.mil_enddate }"></td>
			</tr>
			<tr>
				<th>KOSA 등록</th>
				<td><select name="kosa_reg_yn">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.kosaRegYn}" varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>KOSA 등급</th>
				<td><select name="kosa_class_code">
						<option value="selected">★★선택 ★★</option>
						<c:forEach var="i" items="${common.kosaClassCode}"
							varStatus="status">
							<option value="${i.gubun}${i.code}">${i.name1}</option>
						</c:forEach>
				</select></td>
				<th>*입사일</th>
				<td colspan="2"><input type="date" name="join_day" class="join_day" value="${insa.join_day }"></td>
				<th>퇴사일</th>
				<td colspan="3"><input type="date" name="retire_day" class="retire_day" value="${insa.retire_day }"></td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td><input type="text" size="12" maxlength="12" name="cmp_reg_no" class="cmp_reg_no"></td>
				<th>사업체명</th>
				<td><input type="text" name="crm_name"></td>
				<th>사업자등록증</th>
				<td colspan="2"><input type="text"  id="cmp_upload_txt"  readonly="readonly" value="${insa.cmp_reg_image }" ></td>
				<th colspan="5">
					<button type="button" class="pre_image"  data-toggle="modal" data-target="#myModal">미리보기</button>
					<label class="upload"  for="cmp_reg_image" >등록증 업로드</label> 
					<input type="file"  id="cmp_reg_image" name="cmp_reg_image1"  />
				</th>
			</tr>
			
			<tr>
				<th rowspan="2">자기소개</th>
				<td colspan="3" rowspan="2"><input type="text" placeholder="100자 내외로 적으시오" name="self_intro"></td>
				<th>이력서</th>
				<td colspan="2"><input type="text" id="carrier_upload_txt" readonly="readonly" value="${insa.carrier }" ></td>
				<th colspan="5">
					<button type="button" class="pre_image"   data-toggle="modal" data-target="#myModal1">미리보기</button>
					<label class="upload"  for="carrier" >이력서 업로드</label> 
					<input type="file"  id="carrier" name="carrier1" />
		
				</th>
		</table>
		<!-- 모달창 페이지 -->
		<!-- my modal -->
		<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<img class="card-img-top rounded img-fluid"
							id="modal-image1"
							src="">
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- my modal1 -->
	
		<div class="modal fade" id="myModal" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<c:if test="${not empty insa.carrier }">
						<img class="card-img-top rounded img-fluid" id="modal-image1" src="resources/upload/${insa.cmp_reg_image }">
						</c:if>
						<c:if test="${empty insa.carrier }">
					<!-- 	<img class="card-img-top rounded img-fluid" id="modal-image1" 	src="resources/assets/profile.png" ><br/><br/><br/> -->

						</c:if>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal1" data-backdrop="static"
			data-keyboard="false">
			<div class="modal-dialog modal-xl modal-dialog-centered">
				<div class="modal-content">
					<!-- Modal body -->
					<div class="modal-body">
						<c:if test="${not empty insa.carrier }">
						<img class="card-img-top rounded img-fluid" id="modal-image2" src="resources/upload/${insa.carrier }">
						</c:if>
						<c:if test="${empty insa.carrier }">
						<!-- <img class="card-img-top rounded img-fluid" id="modal-image2" src="resources/assets/profile.png" ><br/><br/><br/> -->
						</c:if>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	

		
	</form>
</body>
</html>


