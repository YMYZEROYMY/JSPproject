<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>

<%--//删除店铺执行界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>正在删除店铺</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    if (admin.deleteShop(Integer.parseInt(request.getParameter("i")))) {
        admin.setShopList();//删除成功后刷新店铺列表
%>
<script>alert("删除成功！");
window.location.href = "../admin.jsp"</script>
<%
} else {
%>
<script>alert("删除失败！");
window.location.href = "../admin.jsp"</script>
<%
    }
%>
</body>
</html>
