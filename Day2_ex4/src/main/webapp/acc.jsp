<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   int accno = Integer.parseInt(request.getParameter("accno"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dxc1","root","root");
			PreparedStatement stmt = conn.prepareStatement("insert into bank values(?,?)");
			stmt.setInt(1, accno);
			stmt.setInt(2, amount);
			int i = stmt.executeUpdate();
			if(i>0) {
				out.println("Saved into database");
				out.println("<html><body>");
				out.println("<a href='home.jsp'>Home</a>");
				out.println("</body></html>");
			}
			
		}catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
%>
</body>
</html>