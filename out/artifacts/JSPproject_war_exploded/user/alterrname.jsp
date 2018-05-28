<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%----%>
<%--//修改店名操作界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>正在修改店名</title>
</head>
<body style="background: url(../img/修改.jpg) no-repeat;background-size: cover">
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    if (auser.alterRname(Integer.parseInt(request.getParameter("i")), request.getParameter("Rname"))) {
%>
<script>alert("修改成功！");
window.location.href = "./sub.jsp"</script>
<%
} else {
%>
<script>alert("修改失败！");
window.location.href = "./input_alter_rname.jsp"</script>
<%
    }
%>
</body>
</html>
