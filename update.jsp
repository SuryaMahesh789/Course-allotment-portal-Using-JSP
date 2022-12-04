<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.*,java.util.*,pageNumber.*, java.util.List" %>
<%@page import="org.apache.catalina.Session" %>

<%

if(request.getParameter("submit")!=null)
{
    String id=request.getParameter("id");
    String name=request.getParameter("sname");
    String course=request.getParameter("course");
    String fee=request.getParameter("fee");

 
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
    pst = con.prepareStatement("update records set sname = ?,course = ?,fee = ? where id = ?");


    pst.setString(1,name);
    pst.setString(2,course);
    pst.setString(3,fee);
    pst.setString(4,id);


    pst.executeUpdate();
    %>

    <script>

        alert("Record Updated Successfully...");

    </script>
    <%
}

%>


   
<!DOCTYPE html>
<html>
    <head>
        <meta http-eqiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Update Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    </head>

    <style>
        h1{
            color:blue;
        }
    </style>

    <body>
        <center><h1>Student Update</h1></center>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">

                    <%

                    Connection conn;
                    PreparedStatement pst2;
                    ResultSet rs2;

                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/school","root","");

                    String id2=request.getParameter("id");

                    pst2=conn.prepareStatement("select * from records where id = ?");

                    pst2.setString(1,id2);

                    rs2 = pst2.executeQuery();
                    while(rs2.next())
                    {

                    

                    %>
        
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs2.getString("sname") %>" name="sname" id="sname" required>
                    </div>
        
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%= rs2.getString("course") %>" name="course" id="course" required>
                    </div>
        
                    <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%= rs2.getString("fee") %>" name="fee" id="fee" required>
                    </div>

                    <%

                        }
                        
                        
                    %>
                    </br>
        
                    <div alight="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>


                    <div align="right">
                        <p><a href="crud.jsp">Click Back</a></p>
                    </div>
        
                </form>
            </div>
        </div>
        
    </body>
</html>
