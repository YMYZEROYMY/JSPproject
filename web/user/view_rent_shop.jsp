<%@ page import="base.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>店铺信息</title>
</head>
<body style="background: url(../img/圆水.jpg) no-repeat;background-size: cover">
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Shop shop = auser.getDetailShop(Integer.parseInt(request.getParameter("i")));
%>
<table align="center" width="20%" border="1">
    <tr style="height: 50px">
        <td>店铺编号：<%=shop.getSno()%>
        </td>
    </tr>
    <tr style="height: 50px">
        <td>地址：<%=shop.getAddr()%>
        </td>
    </tr>
    <tr style="height: 50px">
        <td>费用：<%=shop.getCost()%>
        </td>
    </tr>
    <tr style="height: 50px">
        <td>备注：<%=shop.getSremark()%>
        </td>
    </tr>
    <tr style="height: 50px">
        <td><a href="./sub.jsp">返回</a></td>
    </tr>
</table>
</body>
</html>
