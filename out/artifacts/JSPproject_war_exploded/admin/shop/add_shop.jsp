<%@ page import="base.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>

<%--//添加店铺判断界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>正在添加店铺</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    Shop shop = new Shop();//创建一个新的店铺对象存放信息
    shop.setSno(request.getParameter("Sno"));
    shop.setAddr(request.getParameter("addr"));
    shop.setCost(Integer.parseInt(request.getParameter("cost")));
    shop.setSremark(request.getParameter("Sremark"));
    shop.setState(request.getParameter("state"));
    admin.setShop(shop);
    if (admin.addShop()) {
        admin.setShopList();//添加成功后刷新店铺列表
%>
<script>alert("添加成功！");
window.location.href = "../admin.jsp"</script>
<%
} else {
%>
<script>alert("添加失败！");
window.location.href = "./input_add_shop.jsp"</script>
<%
    }
%>
</body>
</html>
