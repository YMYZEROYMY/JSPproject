<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>筛选价位</title>
</head>
<body>
<%
    int minPrice;
    int maxPrice;
    if(request.getParameter("minPrice")==null||"".equals(request.getParameter("minPrice"))){
        minPrice=0;
    }else{
        minPrice=Integer.parseInt(request.getParameter("minPrice"));
    }
    if(request.getParameter("maxPrice")==null||"".equals(request.getParameter("maxPrice"))){
        maxPrice=100000;
    }else{
        maxPrice=Integer.parseInt(request.getParameter("maxPrice"));
    }
    auser.setMinPrice(minPrice);
    auser.setMaxPrice(maxPrice);
    auser.setSelfUnRentList();
    response.sendRedirect("./sub.jsp");
%>
</body>
</html>
