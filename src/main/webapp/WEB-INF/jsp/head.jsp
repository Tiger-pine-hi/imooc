<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("PATH", request.getContextPath());%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>头部页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) --%>
    <script type="text/javascript" src="${PATH}/static/js/jquery-3.3.1.min.js"></script>
    <%-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 --%>
    <script src="${PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <%-- Bootstrap --%>
    <link href="${PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%-- 自设css和js --%>
    <%--<link href="${PATH}/static/css/reg_log.css" rel="stylesheet">--%>
    <style>
        /* .imgSize{
             width: 200px;
             height: 60px;
         }
         .navbaraSize{
             height: 70px;
         }*/


        .logo {
            margin-left: -10px;
            margin-top:-15px;
            padding-left: 15px;
            padding-right: 15px;
            float: left;
            height: 50px
        }
        .img_size{
            height: 30px;
            width: 30px;
        }
    </style>
</head>
<body>
<%-- 头部--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <a class="navbar-brand" href="#">
                    <img class="logo" src="/static/img/1.png" alt="星盾">
                </a>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav ">
                <li ><a href="${PATH}/Main">首页 <span class="sr-only"></span></a></li>
                <li ><a href="#">免费课程 <span class="sr-only"></span></a></li>
                <li ><a href="#">精品课程 <span class="sr-only"></span></a></li>
            </ul>
            <%--搜索框及按钮 --%>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入课程名">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            
            <c:choose>
                <c:when test="${role == null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${PATH}/Reg"><span class="glyphicon glyphicon-"></span> 注册</a></li>
                        <li><a href="${PATH}/Log"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
                    </ul>
                </c:when>
                <c:when test="${role != null}">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${PATH}/Role"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
                        <li><a href="${PATH}/Logout"><span class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
                    </ul>
                </c:when>
            </c:choose>

        </div>
    </div>
</nav>
</body>
</html>
