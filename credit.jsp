<%@ page language="java" session="false" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    <%@ page import = "java.sql.DriverManager" %>
    <%@ page import = "java.sql.Connection" %>
    <%@ page import = "java.sql.PreparedStatement" %>
    <%@ page import = "java.sql.ResultSet" %>
    <%@ page import = "java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
<% String dbUrl = "jdbc:mysql://localhost:3306/OnlineBanking";
String username = "student";
String password = "student";
HttpSession session = request.getSession();
int bal = (int)session.getAttribute("balance");
try
{
if(bal>0)
bal = bal+1000;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(dbUrl,username,password);
PreparedStatement p = con.prepareStatement("insert into bankdata(debit,credit,balance) values(?,?,?)");
p.setInt(1,0);
p.setInt(2,1000);
p.setInt(3,bal);
p.executeUpdate();
con.close();
}

catch (Exception e)
{

e.printStackTrace();
}
finally
{
response.sendRedirect("Account.jsp");
}
//System.out.print();
%>
<table width="300px" align="center" style="border:1px solid #000000;background-color:#efefef;">
<tr>
<td><%= session.getAttribute("balance") %></td>
</tr>
</table>
</body>
</html>