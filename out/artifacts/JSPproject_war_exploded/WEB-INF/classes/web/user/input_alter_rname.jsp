<%@ page import="base.Rent" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>

<%--//修改店铺名输入界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>修改店名</title>
</head>
<body style="background: url(../img/修改.jpg) no-repeat;background-size: cover">
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Rent rent = auser.getSubRent(Integer.parseInt(request.getParameter("i")));//获取修改前店铺信息
%>
<p><b>您正在修改<%=rent.getSno()%>号店的店名</b></p>
<form action="./alterrname.jsp" method="post">
    <input name="i" value="<%=request.getParameter("i")%>" type="hidden">
    <table align="center" style="height: 400px">
        <tr>
            <td>店名</td>
            <td><input name="Rname" type="text" title="请输入新的店名" value="<%=rent.getRname()%>" required="required"></td>
            <td><input type="submit" value="确定" onclick="return confirm('确定修改吗？')"></td>
        </tr>
    </table>
</form>
</body>
</html>
