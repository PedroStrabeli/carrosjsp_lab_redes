<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="classes.Usuario" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar carro</title>
    </head>
    <body>
        <% Usuario u = (Usuario)session.getAttribute("usuario"); 
        if (u==null) response.sendRedirect("index.jsp");%>
        
        <h2>Carro:</h2>
        <br>
        
        <table width="35%" border="0" cellspacing="5">
            
            
            <%
                String id = request.getParameter("idCarro");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/carros_db","pstr","pstr_poli");
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM \"CARROS\" WHERE IDCARRO=" + id);
            
            if(rs.next()) {
            %>
            <tr bgcolor="#CCCC99"> 
                <td><b><font face="Verdana" size="2" color="#000000">Ano</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Modelo</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Fabricante</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Cor</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Preço</font></b></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("ano")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("modelo")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("fabricante")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("cor")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("preco")%></font></td>
            </tr>
            <br>
            
            
            
            </table>
            
            <form action="enviar.jsp" method="GET">
                <input type="hidden" name="preco" value="<%=rs.getString("preco")%>">
                Conta Bancária : <input type="text" name="contaBancaria"> <br>
                Senha: <input type="text" name="senhaConta"> <br><br>
        <input type="submit" value="Enviar dados"><br>
        
        <%
            }
            conn.close();
            %>
    </form><br>
            
        
        
        
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