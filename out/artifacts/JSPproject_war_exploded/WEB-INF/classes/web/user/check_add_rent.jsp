<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>

<%--//租用店铺操作界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>正在租用</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    if (auser.addRent(Integer.parseInt(request.getParameter("i")), request.getParameter("Rname"))) {
%>
<script>alert("租用成功！");
window.location.href = "./sub.jsp"</script>
<%
} else {
%>
<script>alert("租用失败！");
window.location.href = "./inputaddrent.jsp"</script>
<%
    }
%>
</body>
</html>
