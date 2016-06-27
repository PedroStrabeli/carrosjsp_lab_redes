<%-- 
    Document   : listaCarros
    Created on : Jun 27, 2016, 9:54:37 AM
    Author     : labweb
--%>

<%@page import="java.sql.*"%>
<%@page import= "classes.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Usuario u = (Usuario)session.getAttribute("usuario"); %>
        <p>Olá, <%= u.nome %></p>
        <table width="35%" border="0" cellspacing="5">
            <tr bgcolor="#CCCC99"> 
                <td><b><font face="Verdana" size="2" color="#000000">Modelo</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Fabricante</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Ano</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Cor</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Preço</font></b></td>
                
            </tr>
            
            <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/carros_db","pstr","pstr_poli");
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM \"CARROS\"");
            
            while(rs.next()) {
            %>
            <tr bgcolor="#CCCCFF"> 
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("modelo")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("fabricante")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("ano")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("cor")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("preco")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("preco")%></font></td>
                <td><b><button href="comprar.jsp?idCarro=<%rs.getString("idCarro")%>">Comprar</button>></b></td>
            </tr>
            
            <%
            }
            conn.close();
            %>
            
        </table>
    </body>
</html>
