<%-- 
    Document   : index
    Created on : Jun 27, 2016, 9:35:28 AM
    Author     : labweb
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="classes.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy a Car!</title>
    </head>
    <a href="../../../Desktop/Desenvolvimento WEB/Exemplo/listaContas.jsp"></a>
    <body>
        <%! private int contAcessos; %>
        <%Usuario u = (Usuario)session.getAttribute("usuario"); 
        if (u==null) {

        %>
        <h1>Bem Vindo!</h1> 
        <h2>Identifique-se para continuar</h2>
        <form action = "getlogin.jsp" method="POST">
            <table>
                <td>
                    Login:
                    <br><br>        
                    Senha: 
                </td>
                <td>

                        <input type="text" name="login" placeholder="Digite seu login"/>
                        <br><br>        
                        <input type="text" name="senha" placeholder="Digite sua senha"/>
                        <br><br>

                </td>


            </table>
            <input type="submit" value="Enviar dados"><br>
        </form>
        
        
        <p> Acessos a página: <%= ++contAcessos%> </p>
        
        
        
        <table width="35%" border="0" cellspacing="5">
            <tr bgcolor="#CCCC99"> 
                <td><b><font face="Verdana" size="2" color="#000000">Login</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Senha</font></b></td>
                <td><b><font face="Verdana" size="2" color="#000000">Nome</font></b></td>
            </tr>
            <br><br> 
            <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/carros_db","pstr","pstr_poli");
            
            Statement getUsers = conn.createStatement();
            ResultSet rs = getUsers.executeQuery("SELECT * FROM \"USUARIOS\"");
            
            while(rs.next()) {
            %>
            <tr bgcolor="#CCCCFF"> 
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("login")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("senha")%></font></td>
                <td height="19"><font face="Verdana" size="2"><%=rs.getString("nome")%></font></td>
            </tr>
            
            <%
            }
            conn.close();
            
        
            %>
            
        </table>
            <%
            }
                else response.sendRedirect("listaCarros.jsp");
            %>
    </body>
</html>
