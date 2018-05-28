<%@ page import="base.Shop" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/26
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>

<%--//修改店铺信息输入界面--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="admin" class="bean.Admin" scope="session"/>
<html>
<head>
    <title>修改店铺</title>
    <meta charset="UTF-8">
</head>
<body style="background: url(/img/修改.jpg) no-repeat;background-size: cover">
<%
    //获取界面显示的店铺信息原始值有两种方法：修改前的数据以及修改失败后显示修改失败的信息。此处用第一种
    Shop shop = admin.getSubShopList(Integer.parseInt(request.getParameter("i")));
%>
<a href="../admin.jsp">返回</a>
<form action="./altershop.jsp">
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
            <td><input name="Sremark" value="<%=shop.getSremark()%>" title="备注"></td>
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
            <td><input type="submit" onclick="return confirm('确定修改？')"></td>
        </tr>
    </table>
</form>
</body>
</html>
