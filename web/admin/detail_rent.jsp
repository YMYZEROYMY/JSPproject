<%@ page import="base.Rent" %>
<%@ page import="base.Shop" %>
<%@ page import="base.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>租用详情</title>
</head>
<body style=" background: url(../img/管理员.jpg) no-repeat;background-size: cover;">
<a href="./admin.jsp">返回</a>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Rent rent = admin.getSubRentList(Integer.parseInt(request.getParameter("i")));
    Shop shop = admin.getDetailRentShop(rent.getSno());
    User user = admin.getDetailRentUser(rent.getMno());
%>
<table align="center" width="40%" border="2">
    <tr style="height: 40px">
        <td>商铺编号：<%=shop.getSno()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>地址：<%=shop.getAddr()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>租金：<%=shop.getCost()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>备注：<%=shop.getSremark()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>状态：<%=shop.getState()%>
        </td>
    </tr>
</table>
<table align="center" width="40%" border="2">
    <tr style="height: 40px">
        <td>用户编号：<%=user.getMno()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>姓名：<%=user.getMname()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>生日：<%=user.getBirthday()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>余额：<%=user.getMoney()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>电话：<%=user.getTele()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>备注：<%=user.getMremark()%>
        </td>
    </tr>
    <tr style="height: 40px">
        <td>密码：<%=user.getPasswd()%>
        </td>
    </tr>
</table>
</body>
</html>
