<%-- 
    Document   : index
    Created on : Jun 27, 2016, 8:52:07 AM
    Author     : labweb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.lang.Integer"%>
<%@page import="java.lang.Object"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carros WEB</title>
    </head>
    <body>
            <h1>Faça login</h1>
    </body>
    <%--<%
        Object obj = session.getAttribute("nVisitas");
        String cont = obj.toString();
    %>--%>
    <form action="listaCarros.jsp" method="GET">
        Nome : <input type="text" name="nome"> <br>
        N.Usp: <input type="text" name="nusp"> <br><br>
        <input type="submit" value="Enviar dados"><br>
    </form><br>
    <%--<text>
    <%=session.getAttribute("nVisitas")%>
    </text>--%>
</html>
