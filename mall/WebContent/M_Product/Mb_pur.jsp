<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/head.jsp"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script language='javascript' type='text/javascript'>

var IMP = window.IMP; // 생략가능
IMP.init('imp20196180'); 

function insertCheck(){
	if(frm.m_tel.value == ""){
		alert("전화번호가 입력되지 않았습니다.");
		frm.name.focus();
		return;
	}
	if(frm.m_add.value == ""){
		alert("주소가 입력되지 않았습니다.");
		frm.tel.focus();
		return;
	}

	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제',
	    amount : 100,
	    buyer_name : frm.m_name.value,
	    buyer_tel : frm.m_tel.value,
	    m_redirect_url : 'Mb_pur.jsp'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        alert("상품결제가 완료되었습니다.");
	    	document.frm.submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	}); 
}


function fncAdd(add)

{

    var fm  = document.frm;

    fm.p_count.value = Number(fm.p_count.value)+add;

    SetCookie('num',fm.p_count.value);

}




function getCookieVal (offset)

{

    var endstr = document.cookie.indexOf (";", offset);

    if (endstr == -1) endstr = document.cookie.length;

    return unescape(document.cookie.substring(offset, endstr));

}




function GetCookie (name)

{

    var arg = name + "=";

    var alen = arg.length;

    var clen = document.cookie.length;

    var i = 0;

    while (i < clen) //while open

    {

        var j = i + alen;

        if (document.cookie.substring(i, j) == arg)

            return getCookieVal (j);

        i = document.cookie.indexOf(" ", i) + 1;

        if (i == 0) break;

    } //while close

    return null;

}




function SetCookie (name, value)

{

    var argv = SetCookie.arguments;

    var argc = SetCookie.arguments.length;

    var expires = (2 < argc) ? argv[2] : null;

    var path = (3 < argc) ? argv[3] : null;

    var domain = (4 < argc) ? argv[4] : null;

    var secure = (5 < argc) ? argv[5] : false;

    document.cookie = name + "=" + escape (value) +

        ((expires == null) ? "" :

        ("; expires=" + expires.toGMTString())) +

        ((path == null) ? "" : ("; path=" + path)) +

        ((domain == null) ? "" : ("; domain=" + domain)) +

        ((secure == true) ? "; secure" : "");

}




window.onload = function()

{

    fm  = document.frm;




    var num = GetCookie('p_count');

    if( num==null )

    {

        num = 0;

        SetCookie('num',num);

    }

    else

    {

        fm.p_count.value = num;

    }

}

function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}



</script>
<body>
<form name="frm" method="post" action="Mb_purPro.jsp">
	<table align="center" border="1" width="80%">
		<tr>
			<th></th>
			<th>이미지</th>
			<th>상품명</th>
			<th>색상</th>
			<th>사이즈</th>
			<th>수량</th>
			<th>가격</th>
		</tr>

		<%
		
			String p_no= request.getParameter("p_no");
			
		
			
			Connection conn =jdbcUtil.connect();
			String sql = "select p_no,p_name,p_img,p_color,p_size,count(*) p_count,p_price,sum(p_price) sum from product where p_no=?"
					+ "group by p_no,p_name,p_img,p_color,p_size,p_price";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("p_no"));
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				String p_img = rs.getString("p_img");
				String[] imgs = p_img.split(",");
		%>


		<tr>

			<td align="center"><input type="checkbox" name="memory" value="1"></td>
			<td align="center"><img src="./img/<%=imgs[0]%>" width="150px" height="100px"></td>
			<td align="center">(<%=rs.getString("p_no")%>)<%=rs.getString("p_name")%></td>
			<td align="center"><select name="p_color"><option id="p_color" value="<%=rs.getString("p_color")%>"><%=rs.getString("p_color")%></option></select></td>
			<td align="center"><select name="p_size"><option id="p_size" value="<%=rs.getString("p_size")%>"><%=rs.getString("p_size")%></option></select></td>
			<td align="center"><input type="text" name="p_count" style='width:30px; border:0px; text-align:right;' value="<%=rs.getString("p_count")%>">
        &nbsp;<span style='width:30px; border:solid 1px #000000; cursor:pointer;' onclick='fncAdd(1);'>▲</span>
        &nbsp;<span style='width:30px; border:solid 1px #000000; cursor:pointer;' onclick='fncAdd(-1);'>▼</span></td>
			<td align="center"><%=rs.getString("p_price")%>원</td>
		</tr>
		<tr>
			<th colspan="3" align="center">주문 수량 : <%=rs.getString("p_count")%></th>
			<th colspan="4" align="center"><input type="hidden" name="sum" value="<%=rs.getString("sum")%>">주문 금액 : <%=rs.getString("sum")%>원</th>
		</tr>
		<%
			}
		%>
	</table>
	<input type="hidden" name="p_no" value="<%=p_no%>">
	<br>
	<br>
	<fieldset align="center">
		<legend>주문정보</legend>
			
		<table align="center">
			<tr>
				<th colspan="2" align="center">주문자 정보</th>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="m_id" id="m_id" value="<%=session.getAttribute("M_id") %>"  required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="m_name" id="m_name" value="<%=session.getAttribute("M_name") %>" required></td>
			</tr>
			<tr>
				<th colspan="2" align="center">배송지 정보</th>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="tel" name="m_tel" id="m_tel" value="<%=session.getAttribute("M_tel") %>"	required></td>
			</tr>
			<tr>
				<td>주소</td>
				<td width="100"><input type="text" name="m_add" id="m_add" value="<%=session.getAttribute("M_add") %>" required></td>
			</tr>
		
		</table>
		</fieldset>

		<fieldset align="center">
			<legend>결제방법</legend>
			<input type="radio" name="o_pay" value="1">카드결제<br> 
			<input type="radio" name="o_pay" value="2">무통장입금<br>
			
		</fieldset>
		<br>
		<div name="bt" align="center">
			<button type="button" onclick="insertCheck()">주문하기</button>
			 <input type="reset" value="장바구니비우기">
		</div>
	
</form>
<br>
</body>
<jsp:include page="../common/footer.jsp"></jsp:include>
</html>