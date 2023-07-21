<%@page import="java.sql.*"%>
<%
String uname=request.getParameter("name");
String umob=request.getParameter("mob");
String udept=request.getParameter("dept");
String uqual=request.getParameter("qual");
String uskill=request.getParameter("skill");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","Karan@22");
	Statement st=con.createStatement();
	String s="insert into rec(name,mobno,dept,qual,skill) values('"+uname+"','"+umob+"','"+udept+"','"+uqual+"','"+uskill+"');";
	st.executeUpdate(s);
	String q="select * from rec where name='"+uname+"';";
	ResultSet rs=st.executeQuery(q);
	if(rs.next())
	{
	%>
	<div class="container">
	<h1>Compucom Software Ltd.</h1>
  <h2>Employee Recruitment Form</h2>
  <form name="registration" class="registartion-form" onsubmit="return formValidation()" action="exam.html">
	<table>
	<tr>
        <td><label for="uid">Recruitment Id:</label></td>
        <td><%=rs.getString("RId") %></td>
      </tr>
      <tr>
        <td><label for="name">Name:</label></td>
        <td><%=rs.getString("name") %></td>
      </tr>
      <tr>
        <td><label for="phoneNumber">Mobile Number:</label></td>
        <td><%=rs.getString("mobno") %></td>  
      </tr>
      <tr>
        <td><label for="dept">Department:</label></td>
        <td><%=rs.getString("dept") %></td>
      </tr>
       <tr>
        <td><label for="qual">Qualifications:</label></td>
        <td><%=rs.getString("qual") %></td>
      </tr>
      <tr>
        <td><label for="skill">Skill Set:</label></td>
       <td><%=rs.getString("skill") %></td>
      </tr>
       <tr>
        <td colspan="2"><input type="submit" class="submit" value="Exam Start" /></td>
      </tr>
    </table>
    </form>
</div>
<style>


.container {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  height: 100vh;
  background-color: #6699cc;
}

.container h1 {
  color: white;
  font-family: sans-serif;
  margin: 5px;
}
.container h2 {
  color: white;
  font-family: sans-serif;
  margin: 5px;
}

.registartion-form {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 300px;
  color: rgb(255, 255, 255);
  font-size: 18px;
  font-family: sans-serif;
  background-color: cyan;
  padding: 50px;
}

.registartion-form input,
.registartion-form select,
.registartion-form textarea {
  border: none;
  padding: 5px;
  margin-top: 10px;
  font-family: sans-serif;
}

.registartion-form input:focus,
.registartion-form textarea:focus {
  box-shadow: 3px 3px 10px rgb(228, 228, 228), -3px -3px 10px rgb(224, 224, 224);
}

</style>
	<%
	}
}
catch(Exception e){
    e.printStackTrace();
}
%>