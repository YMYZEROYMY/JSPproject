<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>

<%--//登录验证界面--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="checkuser" class="bean.CheckUser" scope="session"/>
<html>
<head>
    <title>正在登录</title>
</head>
<body>
<jsp:setProperty name="checkuser" property="mno" param="Mno"/>
<jsp:setProperty name="checkuser" property="passwd" param="passwd"/>
<%
    checkuser.setUserMap();//刷新用户列表
    checkuser.setErrorMap();//刷新失败信息
    if (checkuser.check()) {
        if (checkuser.getMno().equals("admin") && checkuser.getPasswd().equals("root")) {//判断是否为管理员
            session.setMaxInactiveInterval(-1);
            session.setAttribute("Mno", "admin");
            session.setAttribute("status", 2);
            response.sendRedirect("../admin/admin.jsp");
            return;
        } else {//设置为普通用户
            session.setMaxInactiveInterval(-1);
            session.setAttribute("Mno", checkuser.getMno());
            session.setAttribute("status", 1);
            response.sendRedirect("../user/sub.jsp");
        }
    } else {
%>
<script>alert("登录失败！");
window.location.href = "./login.jsp"</script>
<%
    }
%>
</body>
</html>
