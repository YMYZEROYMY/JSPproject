<%@ page import="base.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>

<%--//修改个人信息操作界面--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>正在修改信息</title>
</head>
<body>
<%
    auser.setUserMap();//刷新用户列表
    auser.setErrorMap();//刷新错误信息
    User user = new User();//创建一个新的用户对象
    user.setBirthday(request.getParameter("birthday"));
    user.setMremark(request.getParameter("Mremark"));
    user.setTele(request.getParameter("tele"));
    user.setPasswd(request.getParameter("passwd"));
    user.setMname(request.getParameter("Mname"));
    user.setMno(request.getParameter("Mno"));
    auser.setUser(user);
    if (auser.checkMno(request.getParameter("Mno")) && auser.updatePerson()) {
        session.setAttribute("Mno", user.getMno());//修改成功后更新用户session中的用户编号
%>
<script>alert("修改成功！");
window.location.href = "./sub.jsp"</script>
<%
} else {
%>
<script>alert("修改失败！");
window.location.href = "./alterperson.jsp"</script>
<%
    }
%>
</body>
</html>
