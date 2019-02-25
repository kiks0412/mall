<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>shopping mall</title>


<script>
	function goList() {
		location = "ad_pro_list.jsp";
	}
	function insertCheck() {
		if (document.frm.p_name.value == "") {
			alert("상품이 삭제되지 않았습니다.")
			document.frm.p_name.focus();
			return;
		}

		alert("상품 삭제가 완료되었습니다.")
		document.frm.submit();
	}
</script>


<body>
	<h2>product 테이블의 레코드 삭제</h2>

	<form method="post" action="ad_pro_deletePro.jsp">
	상품번호:<input type="text" name="p_no" maxlength="50"><br/> 
	<input type="submit" value="입력완료">
	</form>

</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>




