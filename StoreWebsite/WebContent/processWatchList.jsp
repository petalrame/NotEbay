<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.util.Date,java.text.*"%>
<%
		try {
			//Get the selected command
			String itemnum = session.getAttribute("itemnum").toString();
			String user = session.getAttribute("username").toString();
			
			ApplicationDB db =  new ApplicationDB();
			Connection con = db.getConnection();
		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			
			// Insert the users username and password into the database	
				String query2 = "INSERT Into WatchList Values(\"" + itemnum + "\",\"" + user + "\")";
				System.out.print(query2);
				stmt.executeUpdate(query2);
				
				//close the connection.
			db.closeConnection(con);	
			response.sendRedirect("ItemPage.jsp");
		} catch (Exception e) 
		{
			response.sendRedirect("ItemPage.jsp");
			System.out.print(e);
		}
	%>