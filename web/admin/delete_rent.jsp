<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:22
  To change this template use File | Settings | File Templates.
--%>

<%--//取消出租界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>正在取消出租</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    if (admin.deleteRent(Integer.parseInt(request.getParameter("i")))) {
        admin.setRentList();//取消成功后刷新租用表
%>
<script>alert("取消成功！");
window.location.href = "./admin.jsp"</script>
<%
} else {
%>
<script>alert("取消失败！");
window.location.href = "./admin.jsp"</script>
<%
    }
%>
</body>
</html>
