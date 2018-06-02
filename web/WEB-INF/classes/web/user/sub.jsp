<%@ page import="base.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="base.Rent" %>
<%@ page import="base.Shop" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>

<%--//用户主界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="auser" scope="session" class="bean.AUser"/>
<html>
<head>
    <title>用户</title>
    <style>
        .bg:hover {
            background-color: rgba(190, 190, 190, 0.5);
        }
    </style>
</head>
<body style="background: url(../img/圆水.jpg) no-repeat;background-size: cover">
<%
    if (session.getAttribute("status") == null) {//判断当前session是否已登录成功
        response.sendRedirect("../login_logout/login.jsp");
        return;
    }
    int status = (int) session.getAttribute("status");
    if (status != 1) {//判断是否为用户登录
%>
<script>alert("请先登录");
window.location.href = "../login_logout/login.jsp"</script>
<%
} else {//正文开始！！！
    String Mno = (String) session.getAttribute("Mno");//获取用户登录编号
    auser.setMno(Mno);
    User user = auser.getUser();//获取用户个人信息
%>
<table style="width: 100%">
    <tr>
        <tb><p><b>尊敬的<%=user.getMname()%>，欢迎！</b></p></tb>
        <tb align="right"><a href="../login_logout/logout.jsp">退出 </a></tb>
    </tr>
    <p><b>您上次登陆的时间是<%=user.getDate()%>
    </b></p>
</table>
<details>
    <summary class="bg"><h3>您的信息</h3></summary>
    <table width="80%" align="center" border="5">
        <tr style="height: 40px">
            <td><b>编号</b></td>
            <td><b>姓名</b></td>
            <td><b>生日</b></td>
            <td><b>余额</b></td>
            <td><b>电话</b></td>
            <td><b>备注</b></td>
            <td><b>密码</b></td>
            <td><b>修改</b></td>
        </tr>

        <tr style="height: 30px" class="bg">
            <td><%=Mno%>
            </td>
            <td><%=user.getMname()%>
            </td>
            <td><%=user.getBirthday()%>
            </td>
            <td><%=user.getMoney()%>
            </td>
            <td><%=user.getTele()%>
            </td>
            <td><%=user.getMremark()%>
            </td>
            <td><%=user.getPasswd()%>
            </td>
            <td>
                <a href="./alterperson.jsp">修改</a>
            </td>
        </tr>
    </table>
</details>
<details>
    <summary class="bg"><h3>您已租用</h3></summary>
    <table width="80%" align="center" border="5">
        <tr style="height: 40px">
            <td><b>商铺编号</b></td>
            <td><b>商铺名称</b></td>
            <td><b>费用</b></td>
            <td><b>修改店名</b></td>
            <td><b>不租用</b></td>
        </tr>
        <%
            ArrayList rentList = auser.getRentList();//获取租用表
            int Rsum = 0;//总租金
            for (int i = 0; i < rentList.size(); i++) {
                Rent rent = (Rent) rentList.get(i);
                Rsum += rent.getCost();
        %>
        <tr style="height: 30px" class="bg">
            <td><a href="./view_rent_shop.jsp?i=<%=i%>"><%=rent.getSno()%>
            </a>
            </td>
            <td><%=rent.getRname()%>
            </td>
            <td><%=rent.getCost()%>
            </td>
            <td><a href="./input_alter_rname.jsp?i=<%=i%>">改名</a></td>
            <td><a href="./deleterent.jsp?i=<%=i%>"
                   onclick="return confirm('确定取消租用吗？')">取消租用</a></td>
        </tr>
        <%}%>
        <tr></tr>
        <tr>
            <td colspan="2"><b>费用合计</b></td>
            <td colspan="3"><b><%=Rsum%>
            </b></td>
        </tr>
    </table>
</details>
<details>
    <summary class="bg"><h3>可租用店铺</h3></summary>
    <form action="./find.jsp" method="post">
    <table align="center" width="80%">
            <tr>
                <td align="left">价格:<input name="minPrice" value="<%=auser.getMinPrice()%>" type="text">··<input name="maxPrice" value="<%=auser.getMaxPrice()%>" type="text">
                    <input type="submit" value="确定">
                </td>
            </tr>
    </table>
    </form>
    <table width="80%" align="center" border="5">
        <tr style="height: 40px">
            <td><b>编号</b></td>
            <td><b>地址</b></td>
            <td><b>租金</b></td>
            <td><b>备注</b></td>
            <td><b>租用</b></td>
        </tr>
        <%
            ArrayList unRentList = auser.getSelfUnRentList();//获取可被租用的商铺列表
            for (int i = 0; i < unRentList.size(); i++) {
                Shop shop = (Shop) unRentList.get(i);
        %>
        <tr style="height: 30px" class="bg">
            <td><%=shop.getSno()%>
            </td>
            <td><%=shop.getAddr()%>
            </td>
            <td><%=shop.getCost()%>
            </td>
            <td><%=shop.getSremark()%>
            </td>
            <td><a href="./inputaddrent.jsp?i=<%=i%>">租用</a></td>
        </tr>
        <%}%>
    </table>
</details>
<%
        Date newdate = new Date();//更新用户登录时间
        auser.update(newdate);
    }
%>

</body>
</html>
