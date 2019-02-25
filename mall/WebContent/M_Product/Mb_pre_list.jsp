<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/head.jsp"></jsp:include>
<script language='javascript' type='text/javascript'>


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

 
    <% request.setCharacterEncoding("UTF-8"); %>
 
    <% ArrayList<String> arrr = (ArrayList) (session.getAttribute("productList")); %>
   
<form name="frm" method="post" action="Mb_purPro.jsp">
	  <h1 align="center">장바구니</h1>
	  <hr>
        <%=session.getAttribute("M_name")%>님의 장바구니 목록
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
  
        
         <% if (arrr == null) { %>
        장바구니에 넣은 상품이 없습니다.
        <% } else {
        	String p_no= request.getParameter("p_no");
			
    		
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			Connection conn = DriverManager.getConnection(url, "mall", "1234");
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
			<td align="center"><img src="<%=imgs[0]%>" width="150px" height="100px"></td>
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
	<div name="bt" align="center">
			<input type="submit" value="주문하기"> <input type="reset" value="장바구니비우기">
		</div>
	
                <% }%>
     
</form>
</body>
</html>