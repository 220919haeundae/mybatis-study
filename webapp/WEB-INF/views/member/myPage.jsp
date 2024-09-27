<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
	.outer {
		background-color: tomato;
		color: white;
		width: 1000px;
		margin: auto;
		margin-top: 50px;
	}

	#enroll-form table {margin: auto;}
	#enroll-form input {margin: 5px;}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">마이페이지</h2>
		<form id="enroll-form" action="<%= contextPath %>/update.me" method="post">
			<table>
				<tr>
					<td>* 아이디</td>
					<td>
						<input type="text" name="userId" maxlength="12" minlength="5" value="${ loginUser.userId }" readonly>
					</td>
				</tr>

					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="6" value="${loginUser.userName}" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone" value="${loginUser.phone}"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${loginUser.email}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="${loginUser.address}"></td>
				</tr>
			</table>

			<br><br>
			<div align="center">
				<button type="submit" class="btn btn-sm btn-primary">정보 수정</button>
				<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#updatePwdModal">비밀번호 변경</button>
				<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#deleteMemberModal">회원 탈퇴</button>
			</div>
			<br> <br>
		</form>
	</div>


	<!-- 비밀번호 변경용 모달 -->
	<div class="modal fade" id="updatePwdModal" tabindex="-1" aria-labelledby="updatePwdModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="updatePwdModalLabel">비밀번호 변경</h1>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
			</div>
			<!-- 모달 바디 부분 -->
			<div class="modal-body">
			  <form action="<%= contextPath %>/updatePwd.me" method="post">

				<div class="mb-3">
				  <label for="recipient-name" class="col-form-label">현재 비밀번호: </label>
				  <input type="password" class="form-control" id="userPwd" name="userPwd">
				</div>

				<div class="mb-3">
				  <label for="message-text" class="col-form-label">변경할 비밀번호: </label>
				  <input type="password" class="form-control" id="newPassword" name="newPassword"></input>
				</div>

				<div class="mb-3">
					<label for="message-text" class="col-form-label">변경할 비밀번호 확인: </label>
					<input type="password" class="form-control" id="newPasswordCheck" name="newPasswordCheck"></input>
				</div>
				
				<br>

				<button class="btn btn-sm btn-info" style="border-radius: 10px;" onclick="return pwdCheck();">비밀번호 변경</button>

			  </form>

			</div>
			<!-- 모달 푸터 부분 -->
			<!-- <div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			  <button type="button" class="btn btn-primary">Send message</button>
			</div> -->
		  </div>
		</div>
	</div>


	<!-- 회원탈퇴용 모달 -->
	<div class="modal fade" id="deleteMemberModal" tabindex="-1" aria-labelledby="deleteMemberModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		  <div class="modal-content">
			<div class="modal-header">
			  <h1 class="modal-title fs-5" id="deleteMemberModalLabel">회원 탈퇴</h1>
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
			</div>
			<!-- 모달 바디 부분 -->
			<div class="modal-body">
			  <form action="<%= contextPath %>/delete.me" method="post">
				<input type="hidden" name="userId" value="${ loginUser.userId }">
				<div class="mb-3">
				  <b>탈퇴 후 복구 불가능합니다. <br>그래도 탈퇴하시겠습니까?</b>
				</div>
				<div class="mb-3">
					<label for="message-text" class="col-form-label">비밀번호: </label>
					<input type="password" class="form-control" id="deleteCheckPwd" name="userPwd" required></input>
				</div>
				
				<br>

				<button type="submit" class="btn btn-sm btn-info" style="border-radius: 10px;">탈퇴하기</button>

			  </form>

			</div>
			<!-- 모달 푸터 부분 -->
			<!-- <div class="modal-footer">
			  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			  <button type="button" class="btn btn-primary">Send message</button>
			</div> -->
		  </div>
		</div>
	</div>

	<script>
		function pwdCheck() {
			if($('#newPassword').val() == $('#newPasswordCheck').val()) {
				return true;
			} else {
				alert("변경할 비밀번호를 다시 확인해주세요");
				return false;
			}
		}
	
	</script>

</body>
</html>