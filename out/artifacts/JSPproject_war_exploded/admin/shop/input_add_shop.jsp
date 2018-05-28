<%@ page import="base.Shop" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>

<%--//添加店铺输入信息界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>添加店铺</title>
    <meta charset="UTF-8">
</head>
<body style="background: url(../img/添加.jpg) no-repeat;background-size: cover">
<%Shop shop = admin.getShop();%>
<a href="../admin.jsp">返回</a>
<form action="./add_shop.jsp">
    <table align="center">
        <tr>
            <td>编号</td>
            <td><input name="Sno" type="text" title="商铺编号" required="required" value="<%=shop.getSno()%>"></td>
        </tr>
        <tr>
            <td>地址</td>
            <td><input name="addr" type="text" title="商铺地址" value="<%=shop.getAddr()%>"></td>
        </tr>
        <tr>
            <td>租金</td>
            <td><input name="cost" type="text" title="每月租金" min="0" max="50000" step="1" value="<%=shop.getCost()%>">
            </td>
        </tr>
        <tr>
            <td>备注</td>
            <td><textarea name="Sremark" cols="45" rows="3" title="店铺备注信息"></textarea></td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
                <select name="state" title="是否可出租" required="required">
                    <option value="可出租" title="可被租用">可出租</option>
                    <option value="不出租" title="不可被租用">不出租</option>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" onclick="return confirm('确定添加？')"></td>
        </tr>
    </table>
</form>
</body>
</html>
