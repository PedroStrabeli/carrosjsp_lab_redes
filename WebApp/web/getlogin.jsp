<%-- 
    Document   : getlogin
    Created on : Jun 27, 2016, 10:19:26 AM
    Author     : labweb
--%>

<%@ page import= "java.sql.*" %>
<%@ page import= "classes.Usuario" %>


<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
    </HEAD>

    <BODY>
        <H1>Fetching Data From a Database</H1>

        <% 
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/carros_db","pstr","pstr_poli");
            
            Statement statement = conn.createStatement();

            String Login = request.getParameter("login"); 
            String Senha = request.getParameter("senha"); 

            ResultSet rs = 
                statement.executeQuery("select * from USUARIOS where login = '" + Login + "' and senha = '"+ Senha +"'") ; 

            if(!rs.next()) {
                out.println("Sorry, could not find that publisher. ");
            } else {
                Usuario u = new Usuario(rs.getString("login"),rs.getString("senha"),rs.getString("nome"));
                session.setAttribute("usuario", u);
        %>
        
        <TABLE BORDER="1">
            <TR>
               <TH>login</TH>
               <TH>nome</TH>
               <TH>senha</TH>
           </TR>
           <TR>
               <TD> <%= rs.getString(1) %> </TD>
               <TD> <%= rs.getString(2) %> </TD>
               <TD> <%= rs.getString(3) %> </TD>
           </TR>
           <TR>
               <TD> <%= u.login %> </TD>
               <TD> <%= u.senha %> </TD>
               <TD> <%= u.nome %> </TD>
           </TR>
       </TABLE>
       <BR>
       <% 
           response.sendRedirect("listaCarros.jsp");
            } 
       %>
    </BODY>
</HTML>