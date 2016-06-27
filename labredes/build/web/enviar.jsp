<%-- 
    Document   : enviar
    Created on : Jun 27, 2016, 10:35:33 AM
    Author     : labweb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.jdom.*"%>
<%@page import="org.jdom.output.*"%>
<%@page import="org.jdom.input.*"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@ page import="classes.Usuario" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transação</title>
    </head>
    <body>
        <% Usuario u = (Usuario)session.getAttribute("usuario"); 
        if (u == null) response.sendRedirect("index.jsp");%>
        <h1>Transação</h1>
    </body>
    
    <%
        String conta = request.getParameter("contaBancaria");
        String senha = request.getParameter("senhaConta");
        String preco = request.getParameter("preco");
        
        Element root = new Element("Transferencia");
        Document doc = new Document(root);
        root.addContent(new Element("Conta_Origem").addContent(conta));
        root.addContent(new Element("Senha").addContent(senha));
        root.addContent(new Element("Conta_Destino").addContent("loja"));
        root.addContent(new Element("Valor").addContent(preco));
        
        URL url = new URL("http://192.168.122.196:8080/ServidorXML/BancoXML");
        URLConnection urlconn = url.openConnection();
        urlconn.setDoOutput(true);
        XMLOutputter serializer = new XMLOutputter();
        OutputStream docout = urlconn.getOutputStream();
        serializer.output(doc, docout);
        docout.flush();
        
        InputStream in = urlconn.getInputStream(); //inputStream genérico (arquivo, socket...)
        SAXBuilder builder = new SAXBuilder();
        Document docin = builder.build(in);
        Element nroot = docin.getRootElement();
        String contaResp = nroot.getChildText("Conta_Origem");
        String senhaResp = nroot.getChildText("Senha");
        out.write(conta + " " + senha);
    %>
</html>
