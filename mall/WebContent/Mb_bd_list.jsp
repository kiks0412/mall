<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<title>shopping mall</title>
<meta charset="UTF-8">
<jsp:include page="../common/head.jsp"></jsp:include>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=cp%>/data/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/created.css" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/data/js/util.js"></script>
<%
 request.setCharacterEncoding("utf-8");
 String cp = request.getContextPath();
%>




<script type="text/javascript">
    function sendIt() {
        f = document.myForm;

     str = f.subject.value;
     str = str.trim();
        if(!str) {
            alert("\n제목을 입력하세요. ");
            f.subject.focus();
            return;
        }
     f.subject.value = str;

     str = f.name.value;
     str = str.trim();
        if(!str) {
            alert("\n이름을 입력하세요. ");
            f.name.focus();
            return;
        }
  /-
        if(!isValidKorean(str))  {
            alert("\n이름을 정확히 입력하세요");
            f.name.focus();
            return;
        }
  *-
     f.name.value = str;

        if(f.email.value) {
      if(!isValidEmail(f.email.value)) {
                alert("\n정상적인 E-Mail을 입력하세요. ");
                f.email.focus();
                return;
      }
        }

     str = f.content.value;
     str = str.trim();
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }
     f.content.value = str;

     str = f.pwd.value;
     str = str.trim();
        if(!str) {
            alert("\n패스워드를 입력하세요. ");
            f.pwd.focus();
            return;
        }
     f.pwd.value = str;
     
        f.action = "<%=cp%>/board/created_ok.jsp";
        f.submit();
    }

</script>

</head>
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:80px 16px">
  <h1 class="w3-xlarge">SHOPPING MALL</h1>
  <div align="center">
ID <input type="text" name="M_id" id="id"><br>
PASSWD <input type="password" name="M_passwd" id="passwd">
</div>
  
  <div class="w3-padding-32">
    <div class="w3-bar w3-border">
       <a href="../M_Product/main.jsp" class="w3-bar-item w3-button">Home</a>
      <a href="../Member/Mb_mem_reg.jsp" class="w3-bar-item w3-button w3-light-grey">회원등록</a>
      <a href="../M_Product/Mb_pro_view.jsp" class="w3-bar-item w3-button">상품보기</a>
      <a href="#" class="w3-bar-item w3-button w3-light-grey">주문하기</a>
      <a href="#" class="w3-bar-item w3-button">주문조회</a>
      <a href="#" class="w3-bar-item w3-button w3-hide-small">게시판</a>
    </div>
  </div>
</header>

<h2>쇼핑몰 Title</h2>

<div id="bbs">
 <div id="bbs_title">
 게 시 판
 </div>

 <form name="myForm" method="post" action="">
 <div id="bbsCreated">
  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
    <dd>
          <input type="text" name="subject" size="74" maxlength="100"  class="boxTF" />
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>작성자</dt>
    <dd>
          <input type="text" name="name" size="35" maxlength="20" class="boxTF" />
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_bottomLine">
   <dl>
    <dt>E-Mail</dt>
    <dd>
          <input type="text" name="email" size="35" maxlength="50" class="boxTF" />
    </dd>
   </dl>
  </div>

  <div id="bbsCreated_content">
   <dl>
    <dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
    <dd>
          <textarea name="content" cols="63" rows="12" class="boxTA"></textarea>
    </dd>
   </dl>
  </div>

  <div class="bbsCreated_noLine">
   <dl>
    <dt>패스워드</dt>
    <dd>
          <input type="password" name="pwd" size="35" maxlength="7" class="boxTF" />&nbsp;(게시물 수정 및 삭제시 필요 !!!)
    </dd>
   </dl>
  </div>
 </div>

 <div id="bbsCreated_footer">
        <input type="button" value=" 등록하기 " class="btn2" onclick="sendIt()"/>
        <input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
        <input type="button" value=" 작성취소 " class="btn2" onclick="javas-ript:location.href='<%=cp%>/board/list.jsp';"/>
 </div>

    </form>
</div>

</body>

</html>