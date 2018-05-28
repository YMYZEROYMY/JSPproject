<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>

<%--//取消租用执行界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>取消租用</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    if (auser.deleteRent(Integer.parseInt(request.getParameter("i")))) {
%>
<script>alert("取消成功！");
window.location.href = "./sub.jsp"</script>
<%
} else {
%>
<script>alert("取消失败！");
window.location.href = "./sub.jsp"</script>
<%
    }
%>
</body>
</html>
