<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
	String url = "jdbc:mysql://localhost/world?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root"; 
	String passwd = "1234";			
	Connection con = null;
	String sql = "select * from oneline";
	String sql1 = "DELETE FROm member WHERE idx=?";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");	
	con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();	//select
	while(rs.next()) {
		int no = rs.getInt(1);
		String memo = rs.getString(2);
		String wdate = rs.getString(3);
		
		out.println("^^" + no + ": " + memo + " :(" + wdate + ")<br>");	
		
	}
	rs.close();
	pstmt.close();
	con.close();
	out.println("DB조회 성공");

	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	
		
	PreparedStatement pstmt1 = con.prepareStatement(sql);
	pstmt1.setInt(1, Integer.parseInt(idx));
		
	pstmt1.executeUpdate();
		
	pstmt1.close();
	con.close();
		
	} catch(ClassNotFoundException e)
	{
		out.println(e);
	} catch(SQLException e)
	{
		out.println(e);
	}
%>
<form method="post" action="memo01.html">
<input type="submit" value = "작성"></input>
</form>
</body>
</html>