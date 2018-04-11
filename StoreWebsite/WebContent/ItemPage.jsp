<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.StoreWebsite.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item</title>
</head>
<body>
<%

//out.print(request.getParameter("mySelect"));

if(request.getParameter("mySelect") != null)
{
	session.setAttribute("itemSelect", request.getParameter("mySelect"));
}
if(session.getAttribute("itemSelect") == null)
{
	%>No Item Was Selected<br/>
	<a href="processSearchListings.jsp">Please Select an Item</a>
	<% 
}
else
{
	String itemSelected =session.getAttribute("itemSelect").toString();



ApplicationDB db =  new ApplicationDB();
Connection con = db.getConnection();

//Create a SQL statement
Statement stmt = con.createStatement();
StringTokenizer st = new StringTokenizer(itemSelected);

st.nextToken();
String iNum = st.nextToken();
session.setAttribute("iNum", iNum);
	String query = "SELECT * FROM Item WHERE itemnum =  \"" + iNum + "\" ";
	
	ResultSet result = stmt.executeQuery(query);
	if(result.next())
	{
		session.setAttribute("bidIncrement", result.getString(6));
		session.setAttribute("currentBid",result.getString(4));
	%>
<form action = "processItemBid.jsp" >

<br>
<label> Item Number:  </label>
<label><%=result.getString(2)%></label>
<br>

<br>
<label> Description:  </label>
<label><%=result.getString(8)%></label>
<br>

<br>
<label> Seller:  </label>
<label><%=result.getString(7)%></label>
<br>

<br>
<label> Bid Increment:  </label>
<label>$<%=result.getString(6)%></label>
<br>

<br>
<label> Current Price: </label>
<label>$<%=result.getString(4)%></label>
<br>


 
 		Bid: <input type="text" name="bidAmount"><br>>
		<br>
  		<button type="submit" name="bid" value="Bid">Bid</button>
  		<br>
  		
</form>



<%
	}
}


%>


<form action = "bidHistory.jsp">
		<br>
  		<button type="submit" name="bhistory" value="Bid History">Bid History</button>
  		<br>
	</form>

	<form action = "processWatchList.jsp">
		<br>
  		<button type="submit" name="addToWatchList" value="Watch List">Watch List</button>
  		<br>
	</form>
	
<label>$<%=session.getAttribute("BidOutcome").toString()%></label>
<% session.setAttribute("bidOutcome", "");%>


	<form action = "processSearchListings.jsp">
		<br>
  		<button type="submit" name="back" value="back">back</button>
  		<br>
	</form>
	<%
		String role = (String)session.getAttribute("role");
		String enabled;
		if(role.equals("Customer Rep")){
			enabled = "enabled";
		} else {
			enabled = "disabled";
		}
	%>
	<form action = "CustomerRepItemPage.jsp">
		<br>
  		<button type="submit" name="command" value="customerRep" <%= enabled %> >Customer Rep Page</button>
  		<br>
	</form>
	
	
	
</body>
</html>