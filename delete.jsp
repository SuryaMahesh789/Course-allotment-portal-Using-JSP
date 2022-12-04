
    <%@ page import="java.sql.*" %>
    <%@page import="java.sql.*,java.util.*,pageNumber.*, java.util.List" %>
    <%@page import="org.apache.catalina.Session" %>

                <% 
                
                    String id=request.getParameter("id"); 
                    String name=request.getParameter("sname"); 
                    String course=request.getParameter("course"); 
                    String fee=request.getParameter("fee"); 
                    Connection con; 
                    PreparedStatement pst; 
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost/school","root","");
                    pst=con.prepareStatement("delete from records  where id=?");
                    pst.setString(1,id);
                    pst.executeUpdate();
                    
                    
                    %>

                    <script>

                        alert("Record Deleted Successfully...");
                        window.location.replace("crud.jsp");

                    </script>
                