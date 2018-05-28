<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/27
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>

<%--//退出登录操作界面--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
<%
    session.invalidate();//关闭session线程
    response.sendRedirect("./login.jsp");
%>
</body>
</html>
