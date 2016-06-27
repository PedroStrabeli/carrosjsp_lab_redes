<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="classes.Usuario" %>

<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Carros</title>
    </head>
    <body>
        
        <h2>Carros:</h2>
        <br>
        <% Usuario u = (Usuario)session.getAttribute("usuario"); %>
        <p>Olá, <%= u.nome %></p>
        <table width="35%" border="0" cellspacing="5">
            <tr bgcolor="#CCCC99"> 
                <td><b><font face="Verdana" size="2" color="#000000">Ano</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Modelo</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Fabricante</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Cor</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Preço</font></b></td>
            </tr>
            
            <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/labredes","administrador","admin");
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM \"CARROS\"");
            
            while(rs.next()) {
            %>
            <tr bgcolor="#CCCCFF"> 
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("ano")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("modelo")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("fabricante")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("cor")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("preco")%></font></td>
                <td height="19">
                    <form action="comprar.jsp" method="GET">
                        <input type="hidden" name="idCarro" value="<%=rs.getString("idCarros")%>">
                        <input type="submit" value="Comprar">
                    </form>
                </td>
            </tr>
            
            <%
            }
            conn.close();
            %>
            
        </table>
        
        
        <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
        <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    
    </body>
</html>