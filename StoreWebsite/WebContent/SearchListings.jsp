<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listing</title>
</head>
<body>

<h1>My Account</h1>
		<form action = "listing.jsp">
			Search: <input type="text" name="search"><br>
		<br>
			<button type="button" name="listing" value="Search Listings">Search Listings</button>
		<br>
		</form>				  

<%
		try {
			
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Get the selected 
			String entity = request.getParameter("listing");
			
			int temp1 = 0;
			String temp2  = "name";
			//String insert = "INSERT INTO Item VALUES(\"00/00/0000\",\"0001\",\"10\",\"1\",\"1\",\"Seller\",\"descript\",\"name\")";
			//String insert = "INSERT INTO Item VALUES(\"" + temp2 + "\",\"" + temp2 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp1 + "\",\"" + temp2 + "\",\"" + temp2 + "\")";
			//Run the query against the database.
			//int rowsUpdated = stmt.executeUpdate(insert);
			//if(rowsUpdated == 1){
				//out.print("You have succesfully created an account.");
		//	} else{
			//	out.print("A user with those credentials already exists.");
			//};
			
		
			
				// Retrieve data about End User
				String search = request.getParameter("search");
				out.print(search);
				search = "josh";
				String temp = "computer";
				String query = "SELECT * FROM Item I WHERE name = \"" + temp + "\";"; //\"" + search ;
				out.print("TEST");
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(query);
				//out.print("testig");
				
				int i = 0;
				
				List<String> list = new ArrayList<String>();
				result.next();
				while(result.isAfterLast() == false)
				{
					list.add(result.getString(8));
					result.next();
				//list.add("hello");
				//list.add("afsd");
				}
				
				
				
				%>
				<table>
				<tr>
				<td><form method="post" name="" action="">
				<select name="mySelect" STYLE="width:80px">
				<%
				//suppose u ve an array of permission and array of 
				// value or numeric id matching at respective index


				// some how u fill both the arrays from database or hard-coded 
				//it depends on you
				for (int z=0; z< list.size(); z++){
				if(list.get(z) != null)
				%>
				<option value="<%=list.get(z) %>"><%= list.get(z) %></option>
				<%
				}
				%>
				</select></form>
				</td>
				</tr>
				</table>
				<%
				
				//request.setAttribute("list", list);
				//request.getRequestDispatcher("/WEB-INF/SearchListing.jsp").forward(request, response);

			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>
	
	
	

</body>
</html>