<%@ page import="base.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>

<%--//输入修改用户信息界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>修改用户</title>
    <meta charset="UTF-8">
</head>
<body style="background: url(/img/修改.jpg) no-repeat;background-size: cover">
<%
    User user = admin.getSubUserList(Integer.parseInt(request.getParameter("i")));//获取用户修改前信息
%>
<h2>正在对用户<%=user.getMno()%>的信息进行修改</h2>
<form action="./alteruser.jsp">
    <input name="i" type="hidden" value="<%=request.getParameter("i")%>">
    <table align="center">
        <tr>
            <td>姓名</td>
            <td><input name="Mname" type="text" required="required" title="无限制"
                       value="<%=user.getMname()%>">*
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input name="passwd" type="password" required="required" title="请牢记你的密码"
                       value="<%=user.getPasswd()%>">*
            </td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input name="birthday" type="date" onclick="DataView" title="出生日期"
                       value="<%=user.getBirthday()%>"></td>
        </tr>
        <tr>
            <td>余额</td>
            <td><input name="money" type="text" title="请填写阿拉伯数字" value="<%=user.getMoney()%>"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input name="tele" type="text" title="联系电话" value="<%=user.getTele()%>"></td>
        </tr>
        <tr>
            <td>备注</td>
            <td><input name="Mremark" type="text" title="个人情况" value="<%=user.getMremark()%>"></td>
        </tr>
        <tr>
            <td><input type="submit" value="确定" onclick="return confirm('确定修改？')"></td>
        </tr>
    </table>
</form>
</body>
</html>
