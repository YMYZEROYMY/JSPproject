<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>

//根界面！！！判断当前session该跳转的界面

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>check</title>
</head>
<body>
<%
    if (session.getAttribute("Mno") == null) {
%>
<script>alert("请先登录");window.location.href="login_logout/login.jsp"</script>
<%
        return;
    }
    int status=(int)session.getAttribute("status");
    if(status==1){
        response.sendRedirect("user/sub.jsp");
        return;
    }else if(status==2){
        response.sendRedirect("admin/admin.jsp");
        return;
    }else{
        response.sendRedirect("login_logout/login.jsp");
    }
%>
</body>
</html>
