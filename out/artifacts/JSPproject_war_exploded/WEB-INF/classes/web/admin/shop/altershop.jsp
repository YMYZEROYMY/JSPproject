<%@ page import="base.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>

<%--//判断修改店铺信息界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>正在修改店铺</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    Shop shop = new Shop();//创建一个新的店铺对象
    shop.setSno(request.getParameter("Sno"));
    shop.setAddr(request.getParameter("addr"));
    shop.setCost(Integer.parseInt(request.getParameter("cost")));
    shop.setSremark(request.getParameter("Sremark"));
    shop.setState(request.getParameter("state"));
    admin.setShop(shop);
    if (admin.alterShop()) {
        admin.setShopList();//修改成功后刷新店铺列表
%>
<script>alert("修改成功！");
window.location.href = "../admin.jsp"</script>
<%
} else {
%>
<script>alert("修改失败！");
window.location.href = "./input_alter_shop.jsp"</script>
<%
    }
%>
</body>
</html>
