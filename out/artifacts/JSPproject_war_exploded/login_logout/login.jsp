<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>

<%--//登录界面--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="checkuser" class="bean.CheckUser" scope="session"/>
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8">
    <style>
        .submit {
            background-color: dodgerblue;
            width: 100px;
            height: 30px;
            align: left;
        }

        .submit:hover {
            width: 120px;
            height: 36px;
            background-color: blue;
        }

        .reset {
            background-color: snow;
            width: 100px;
            height: 30px;
            align: right;
        }

        .reset:hover {
            width: 120px;
            height: 36px;
            background-color: darkgray;
        }
    </style>
</head>
<body style="background: url(../img/登录.jpg) no-repeat;background-size: cover">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h1><b>欢迎来到YMY商城</b></h1>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<form action="./check.jsp" method="post">
    <table style="width: 300px" align="center" border="1">
        <tr style="height: 50px" align="center">
            <td><b>编号：</b><input type="text" name="Mno" title="忘了找管理员"
                                 value="<jsp:getProperty name="checkuser" property="mno"/>" required="required">
                <span style="color: red"><%=checkuser.getError("Mno")%></span>
                <%--//获取登录失败信息--%>
            </td>
        </tr>
        <tr style="height: 50px" align="center">
            <td><b>密码：</b><input type="password" name="passwd" title="忘了找管理员" required="required"
                                 value="<jsp:getProperty name="checkuser" property="passwd"/>">
                <span style="color: red"><%=checkuser.getError("passwd")%></span>
                <%--//获取登录失败信息--%>
            </td>
        </tr>

        <tr align="center">
            <td>
                <input type="submit" value="登录" class="submit">
                <input type="reset" value="重置" class="reset">
            </td>
        </tr>
        <tr>
            <td><a href="register.jsp">注册新用户</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
