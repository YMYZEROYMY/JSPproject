<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 1:28
  To change this template use File | Settings | File Templates.
--%>

<%--//注册执行界面--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="checkuser" class="bean.CheckUser" scope="session"/>
<html>
<head>
    <title>正在注册</title>
</head>
<body>
<jsp:setProperty name="checkuser" property="mno" param="Mno"/>
<jsp:setProperty name="checkuser" property="mname" param="Mname"/>
<jsp:setProperty name="checkuser" property="birthday" param="birthday"/>
<jsp:setProperty name="checkuser" property="tele" param="tele"/>
<jsp:setProperty name="checkuser" property="mremark" param="Mremark"/>
<jsp:setProperty name="checkuser" property="passwd" param="passwd"/>
<%
    checkuser.setUserMap();//刷新用户列表
    checkuser.setErrorMap();//刷新错误信息
    if (checkuser.checkRegister() && checkuser.addUser()) {//判断注册是否成功
%>
<script>alert("注册成功！");
window.location.href = "./login.jsp"</script>
<%
} else {
%>
<script>alert("注册失败！");
window.location.href = "./register.jsp"</script>
<%
    }
%>
</body>
</html>
