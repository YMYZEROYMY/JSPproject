<%@ page import="base.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>

<%--//租用店铺输入店名界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>租用店铺</title>
</head>
<body style="background: url(../img/添加.jpg) no-repeat;background-size: cover">
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Shop shop = auser.getSubShop(Integer.parseInt(request.getParameter("i")));//获取将要租用的店铺信息
    if ((auser.getUser()).getMoney() < shop.getCost()) {%>//先判断用户余额是否充足
<script>alert("余额不足，请先充值！管理员电话：138888888888");window.location.href="./sub.jsp"</script>
<%
} else {
%>
<p><b>您正在租用<%=shop.getSno()%>号店</b></p>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<form action="./check_add_rent.jsp" method="post">
    <input name="i" value="<%=request.getParameter("i")%>" type="hidden">
    <table align="center">
        <tr>
            <td>店名:<input name="Rname" type="text" title="取个店名吧" required="required">
                <input type="submit" value="确定" onclick="return confirm('确定租用吗？')"></td>
        </tr>
        <tr><td>*租用立即扣除第一个月租金！</td></tr>
    </table>
</form>
<%}%>
</body>
</html>
