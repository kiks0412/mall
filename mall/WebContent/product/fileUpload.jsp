<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="sun.nio.ch.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String realFolder = "";
String saveFolder = "/M_Product/img";
int maxSize = 5*1024*1024;

ServletContext context = getServletContext();
realFolder = context.getRealPath(saveFolder);
out.println("the tealpath is : "+realFolder+"<br>");
String filename ="";
try{
	MultipartRequest multi = null;
	
	multi=new MultipartRequest(request,realFolder,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
	Enumeration<?> params = multi.getParameterNames();
	
	while(params.hasMoreElements()){
		String name = (String)params.nextElement();
		String value = multi.getParameter(name);
		out.println(name+"="+value+"<br>");
		
	}
	out.println("--------------<br>");


Enumeration<?> files = multi.getFileNames();

while(files.hasMoreElements()){
	String name=(String)files.nextElement();
	
	 filename = multi.getFilesystemName(name);
	
	String  original = multi.getOriginalFileName(name);
	
	String type = multi.getContentType(name);
	
	File file = multi.getFile(name);
	
	out.println("파라미터 이름"+name+"<br>");
	out.println("실제 파일 이름"+original+"<br>");
	out.println("저장된 파일 이름"+filename+"<br>");
	out.println("파일타입"+type+"<br>");
	
	if(file!=null){
		out.println("크기:"+file.length());
		out.println("<br>");
		
	}
	
}
}catch(IOException ioe){
	System.out.println(ioe);
}catch(Exception ex){
	System.out.println(ex);
}
%>
<script>
	alert("파일첨부완료");
	opener.frm.p_img.value="<%=filename%>";
	window.close();
</script>
