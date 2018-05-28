<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>

<%--//输入注册信息界面--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="checkuser" scope="session" class="bean.CheckUser"/>
<html>
<head>
    <title>注册</title>
</head>
<body style="background: url(../img/添加.jpg) no-repeat;background-size: cover">
<a href="./login.jsp">返回</a>
<form action="./checkregister.jsp">
    <table align="center">
        <tr>
            <td>编号</td>
            <td><input name="Mno" type="text" required="required" title="客户编号"
                       value="<jsp:getProperty name="checkuser" property="mno"/>">*
                <spen style="color: red"><%=checkuser.getError("register")%>
                    <%--//显示失败信息--%>
                </spen>
            </td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input name="Mname" type="text" required="required" title="无限制"
                       value="<jsp:getProperty name="checkuser" property="mname"/>">*
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input name="passwd" type="password" required="required" title="请牢记你的密码"
                       value="<jsp:getProperty name="checkuser" property="passwd"/>">*
            </td>
        </tr>
        <tr>
            <td>生日</td>
            <td><input name="birthday" type="date" onclick="DataView" title="出生日期"
                       value="<jsp:getProperty name="checkuser" property="birthday"/>"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input name="tele" type="text" title="联系电话" value="<jsp:getProperty name="checkuser" property="tele"/>">
            </td>
        </tr>
        <tr>
            <td>备注</td>
            <td><textarea name="Mremark" cols="45" rows="3" title="个人备注信息"></textarea></td>
        </tr>
        <tr>
            <td><input type="submit" value="确定" onclick="return confirm('确定添加？')"></td>
        </tr>
    </table>
</form>
</body>
</html>
