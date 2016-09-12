<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*"%>    
<%@ page import = "java.sql.*"%> 
<%@ page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action ="movies.jsp" method="get">
<input type="text" name="Category">&nbsp &nbsp &nbsp
<input type = "submit" value="search"> -->

<%

String category = request.getParameter("Category");

Class.forName("com.mysql.jdbc.Driver");

Connection cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/movie_categories", "root", "aaaDsa210");
String command = "";
if (category==null || category.isEmpty()){
		command = "select Title, Category, Images from movies";
		}
	else{
		command = "select Title, Category, Images from movies where Category like'%" + category + "%'";
}
	//step 3 create statement
	Statement selectMovies= cnn.createStatement();

	//step 4 execute statement
	selectMovies.executeQuery(command);

	//step 5 create a table for results
	ResultSet rs = selectMovies.executeQuery(command);
	out.print("<table border=1>");
	while(rs.next()){ //if true, pointer advances to next available row and knows where to stop.
		out.print ("<tr>");
		out.print("<td>" + rs.getString(1) + "</td>"); //rs starts with 1, not 0
		out.print("<td>" + rs.getString(2) + "</td>");
			 
		//out.print("<td><img src=\"images" + rs.getString(3) + "/></td>");
			out.print("</table>");
		
		//to do: 1.) add search via title 2.) add background 3.) fix image path in table

	 %>
	
</form>

</body>
</html>