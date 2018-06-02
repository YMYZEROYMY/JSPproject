<%@ page import="base.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>

<%--//修改用户信息操作界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>正在修改用户</title>
    <meta charset="UTF-8">
</head>
<body>
<%
    User oldUser = admin.getSubUserList(Integer.parseInt(request.getParameter("i")));
    User user = new User();//创建一个新的用户对象
    user.setBirthday(request.getParameter("birthday"));
    user.setMremark(request.getParameter("Mremark"));
    user.setTele(request.getParameter("tele"));
    user.setPasswd(request.getParameter("passwd"));
    user.setMname(request.getParameter("Mname"));
    user.setMoney(Integer.parseInt(request.getParameter("money")));
    user.setMno(oldUser.getMno());
    admin.setUser(user);
    if (admin.alterPerson()) {
        admin.setSelfUserList();//修改成功后刷新用户列表
%>
<script>alert("修改成功！");
window.location.href = "../admin.jsp"</script>
<%
} else {
%>
<script>alert("修改失败！");
window.location.href = "./input_alter_user.jsp"</script>
<%
    }
%>
</body>
</html>
