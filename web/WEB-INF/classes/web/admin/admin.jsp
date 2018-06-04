<%--//管理员界面--%>

<%@ page import="base.Rent" %>
<%@ page import="base.Shop" %>
<%@ page import="base.User" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>管理员</title>
    <meta charset="UTF-8">
    <style type="text/css">
        .bg:hover {
            /*/ / 半透明背景*/
            background-color: rgba(205, 192, 176, 0.5);
        }
    </style>
</head>
<body style=" background: url(../img/管理员.jpg) no-repeat;background-size: cover;">
<%
    if (session.getAttribute("status") == null) {//判断是否曾经登录
        response.sendRedirect("../login_logout/login.jsp");
        return;
    }
    int status = (int) session.getAttribute("status");
    if (status != 2) {//判断是否登录为管理员
%>
<script>alert("请先登录");
window.location.href = "../login_logout/login.jsp"</script>
<%
} else {//正文开始！！！
%>
<%--显示动态时间--%>
<p id="time1" style="color: black;"></p>
<script>
    function mytime() {
        var a = new Date();
        var b = a.toLocaleTimeString();
        var c = a.toLocaleDateString();
        document.getElementById("time1").innerHTML = c + "&nbsp" + b;
    }

    setInterval(function () {
        mytime()
    }, 1000);
</script>

<tr>
    <td align="right"><a href="../login_logout/logout.jsp">退出</a></td>
</tr>
<details>
    <summary class="bg"><h3>商户表</h3></summary>
    <form action="find/find_user.jsp" method="post">
        <table align="center" width="80%">
            <tr>
                <td>编号或姓名：<input name="findUser" type="text" value="<%=admin.getFindUser()%>">
                    <input value="搜索" type="submit"></td>
            </tr>
        </table>
    </form>
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
            <td><b>删除</b></td>
        </tr>
        <%
            ArrayList userList = admin.getSelfUserList();//获取用户列表
            for (int i = 0; i < userList.size(); i++) {
                User user = (User) userList.get(i);
        %>
        <tr style="height: 30px" class="bg">
            <td><%=user.getMno()%>
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
                <a href="user/input_alter_user.jsp?i=<%=i%>">修改</a>
            </td>
            <td><a href="user/delete_user.jsp?i=<%=i%>" onclick="return confirm('确定删除？')">删除</a></td>
        </tr>
        <%}%>
    </table>
</details>
<details>
    <summary class="bg"><h3>商铺表</h3></summary>
    <form action="find/find_shop.jsp">
        <table width="80%" align="center">
            <tr>
                <td>输入编号：<input name="findShop" type="text" value="<%=admin.getFindShop()%>">
                    <input type="submit" value="搜索"></td>
                <td align="right"><a href="shop/input_add_shop.jsp">添加商铺</a></td>
            </tr>
        </table>
    </form>
    <table width="80%" border="5" align="center">
        <tr style="height: 40px">
            <td><b>编号</b></td>
            <td><b>地址</b></td>
            <td><b>租金</b></td>
            <td><b>备注</b></td>
            <td><b>状态</b></td>
            <td><b>修改</b></td>
            <td><b>删除</b></td>
        </tr>
        <%
            ArrayList shopList = admin.getSelfShopList();//获取商铺列表
            int Ssum = 0;//商铺总租费
            for (int i = 0; i < shopList.size(); i++) {
                Shop shop = (Shop) shopList.get(i);
                Ssum += shop.getCost();
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
            <td><%=shop.getState()%>
            </td>
            <td>
                <a href="shop/input_alter_shop.jsp?i=<%=i%>">修改</a>
            </td>
            <td><a href="shop/delete_shop.jsp?i=<%=i%>" onclick="return confirm('确定删除？')">删除</a></td>
        </tr>
        <%}%>
        <tr></tr>
        <tr>
            <td colspan="2"><b>租金合计</b></td>
            <td colspan="5"><b><%=Ssum%>
            </b></td>
        </tr>
    </table>
</details>
<details>
    <summary class="bg"><h3>租用表</h3></summary>
    <form action="find/find_rent.jsp">
        <table align="center" width="80%">
            <tr>
                <td>商铺编号或商户编号：<input name="findRent" value="<%=admin.getFindRent()%>" type="text">
                    <input type="submit" value="搜索"></td>
            </tr>
        </table>
    </form>
    <table width="80%" border="5" align="center">
        <tr style="height: 40px">
            <td><b>商铺编号</b></td>
            <td><b>商户编号</b></td>
            <td><b>租金</b></td>
            <td><b>店名</b></td>
            <td><b>取消出租</b></td>
        </tr>
        <%
            ArrayList rentList = admin.getSelfRentList();//获取租用信息表
            int Rsum = 0;//租金总额
            for (int i = 0; i < rentList.size(); i++) {
                Rent rent = (Rent) rentList.get(i);
                Rsum += rent.getCost();
        %>
        <tr style="height: 30px" class="bg">
            <td><a href="./detail_rent.jsp?i=<%=i%>"><%=rent.getSno()%>
            </a>
            </td>
            <td><%=rent.getMno()%>
            </td>
            <td><%=rent.getCost()%>
            </td>
            <td><%=rent.getRname()%>
            </td>
            <td><a href="./delete_rent.jsp?i=<%=i%>" onclick="return confirm('确定取消出租？')">取消出租</a></td>
        </tr>
        <%}%>
        <tr></tr>
        <tr>
            <td colspan="2"><b>总收入</b></td>
            <td colspan="3"><b><%=Rsum%>
            </b></td>
        </tr>
    </table>
</details>
<%
    }
%>
</body>
</html>
