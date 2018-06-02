<%@ page import="base.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>

<%--//修改个人信息输入界面--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="auser" class="bean.AUser" scope="session"/>
<html>
<head>
    <title>修改信息</title>
</head>
<body style="background: url(../img/修改.jpg) no-repeat;background-size: cover">
<%
    User user = auser.getUser();//获取修改前信息
%>
<form action="./check_alter_person.jsp">
    <table align="center">
        <tr>
            <td>编号</td>
            <td>
                <input name="Mno" value="<%=user.getMno()%>" required="required" title="不可重复" type="text">
                <spen style="color: red"><%=auser.getError("checkMno")%>*
                </spen>
            </td>
        </tr>
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
