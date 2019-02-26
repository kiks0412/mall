<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>shopping mall</title>
<meta charset="UTF-8">
<jsp:include page="../common/head.jsp"></jsp:include>
<head>
<%
 request.setCharacterEncoding("utf-8");
 String cp = request.getContextPath();
%>

	<title>게시판 목록 화면구현</title>
	<style>
		*{
			box-sizing: border-box;
			}
		body{
			font-family: 나눔고딕;
			padding:10px;
			background:#f1f1f1;
			}
		header{
			padding:30px;
			text-align:center;
			background:white;
			}
		header h1{
			font-size:50px;
			}
		nav{
			overflow:hidden;
			background-color:#333;
			}
		nav a{
			display:block;
			float:left;
			color: #f2f2f2;
			text-align:center;
			padding:14px 16px;
			text-decoration:none;
			}
		nav a:hover{
			background-color:#ddd;
			color:black;
			}
		.leftcolumn{
			float:left;
			width:75%;
			}
		.rightcolumn{
			text-align:center;
			float:left;
			width:25%;
			padding-left:20px;
			background-color:#f1f1f1;
			}
		.f_img{
			background-color:#aaa;
			border-radius:15px;
			margin:10px 0;
			width:98%;
			padding:20px;
			}
		.card{
			background-color:white;
			padding:20px;
			margin-top:20px;
			}
		.container{
			padding-left:10px;
			}
		table{
			width:100%;
			text-align:center;
			}
		table th{
			border-bottom:1px solid #ddd;
			padding:5px;
			}
		table td{
			padding:5px;
			}
		#num{
			text-align:center;
			}
		tbody{
			font-size:13px;
			}
		tbody tr:nth-child(odd){
			background-color:#eee;
			}
		.page_n{
			text-align:center;
			}
		.page_n ul li{
			display:inline-block;
			list-style:none;
			}
		.page_n ul li a{
			text-decoration:none;
			padding:0 7px;
			}
		.page_n ul li a:hover{
			background-color:#ddd;
			}
		#textfield:hover{
			background-color:#ffffcc;
			}
		label{
			font-size:14px;
			}
		footer{
			clear:both;
			padding:20px;
			text-align:center;
			background:#ddd;
			margin-top:20px;
			}
	</style>
<body>
		<div class="leftcolumn">
		<div class="card">
		<div class="container">
			<h3>게시판 제목</h3>
			<hr>
		<table class="table table-striped">
			<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>	
			</thead>
			<tbody>
					<tr>
						<td>1</td>
						<td>게시판 글제목 출력되는 항목입니다.</td>
						<td>글작성자이름</td>
						<td>2018.07.06</td>
						<td>100</td>
					</tr>
					<tr>
						<td>2</td>
						<td>게시판 글제목 출력되는 항목입니다.</td>
						<td>글작성자이름</td>
						<td>2018.07.06</td>
						<td>200</td>
					</tr>
					<tr>
						<td>3</td>
						<td>게시판 글제목 출력되는 항목입니다.</td>
						<td>글작성자이름</td>
						<td>2018.07.06</td>
						<td>300</td>
					</tr>
					<tr>
						<td>4</td>
						<td>게시판 글제목 출력되는 항목입니다.</td>
						<td>글작성자이름</td>
						<td>2018.07.06</td>
						<td>400</td>
					</tr>
					<tr>
						<td>5</td>
						<td>게시판 글제목 출력되는 항목입니다.</td>
						<td>글작성자이름</td>
						<td>2018.07.06</td>
						<td>500</td>
					</tr>
			</tbody>
		</table>
				<hr>
				<button style="float:right">글쓰기</button>
				<div class="page_n">
					<ul>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
				<div>
					<label for="textfield">제목 + 작성자</label>
					<input type="text" name="textfield" id="textfield"/>
					<button>검색</button>
				</div>
			</div>
			</div>
			</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>	