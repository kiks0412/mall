<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>shopping mall</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, h1 {
	font-family: "Raleway", Arial, sans-serif
}

h1 {
	letter-spacing: 6px
}

.w3-row-padding img {
	margin-bottom: 12px
}
</style>

<script>
	function goList() {
		location = "ad_pro_list.jsp";
	}
	
	function insertCheck() {
		if (document.frm.p_name.value == "") {
			alert("상품이 등록되지 않았습니다.")
			document.frm.p_name.focus();
			return;
		}

		alert("상품 등록이 완료되었습니다.")
		document.frm.submit();
	}

	function goDelete(p_no) {
		if (confirm("삭제하시겠습니까?")) {
			alert("상품 삭제가 완료되었습니다.")
			location = "ad_pro_deletePro.jsp?p_no=" + p_no;
		}
	}
	
	function fileupload() {
		window.open("fileForm.jsp", "file", "width=300,height=300")
	}
</script>
<body>

	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 1500px">

		<!-- Header -->
		<jsp:include page="../common/head.jsp"></jsp:include>

		<!-- !PAGE START! -->
		<%
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.29:1521:xe", "mall", "1234");
			String sql = "select * from product where p_no=?";
			String p_no = request.getParameter("p_no");
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_no);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String p_name = rs.getString("p_name");
			String p_tag = rs.getString("p_tag");
			String p_color = rs.getString("p_color");
			String p_size = rs.getString("p_size");
			String p_img = rs.getString("p_img");
			String p_price = rs.getString("p_price");
			String p_info = rs.getString("p_info");
			String p_condition = rs.getString("p_condition");
		%>
		<section>
			<h3 align="center"
				style="background-color: #f5c2f8; font-size: 25px; width: 60%; margin: auto;">상품
				수정</h3>
			<form name="frm" action="updatead_pro_modPro.jsp" method="post">

				<input type="hidden" name="p_no" value="<%=p_no%>" />
				<table border align="center" width=60%>
					<tr>
						<td class="label">상품 번호</td>
						<td><input type="text" name="p_no" id="p_no"
							value="<%=p_no%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="label">상품 이름</td>
						<td><input type="text" name="p_name" id="p_name"
							value="<%=p_name%>"></td>
					</tr>
					<tr>
						<td class="label">상품 태그</td>
						<td><input type="text" name="p_tag" id="p_tag"
							value="<%=p_tag%>"></td>
					</tr>
					<tr>
						<td class="label">상품 색상</td>
						<td><input type="text" name="p_color" id="p_color"
							value="<%=p_color%>"></td>
					</tr>

					<tr>
						<td class="label">사이즈</td>
						<td><input type="text" name="p_size" id="p_size"
							value="<%=p_size%>">
					</tr>
					<tr>
						<td class="label">이미지</td>
						<td><input type="text" name="p_img" id="p_img">
							<button type="button" onclick="fileupload()">파일첨부</button></td>
					<tr>
						<td class="label">가격</td>
						<td><input type="text" name="p_price" id="p_price"
							value="<%=p_price%>"></td>
					</tr>
					<tr>
						<td class="label">정보</td>
						<td><textarea rows="5" cols="100" name="p_info" id="p_info"><%=p_info%></textarea></td>
					</tr>
					<tr>
						<td class="label">상태</td>
						<td><select name="p_condition" id="p_conditio"
							value="<%=p_condition%>">
								<option value="0">품절</option>
								<option value="1">판매</option>
						</select></td>
					</tr>
				</table>
				<div style="text-align: center">
					<button type="button" onclick="insertCheck()">등록</button>
					<button type="button" onclick="goList()">조회</button>
					<button type="button" onclick="goDelete('<%=p_no%>')">삭제</button>
				</div>
			</form>
		</section>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>