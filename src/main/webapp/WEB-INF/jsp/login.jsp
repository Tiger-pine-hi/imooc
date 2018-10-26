<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("PATH", request.getContextPath());%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>登录页面</title>
    <%-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="${PATH}/static/js/jquery-3.3.1.min.js"></script>
    <%-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <%-- Bootstrap -->
    <link href="${PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <%-- 自设css和js --%>
    <script src="${PATH}/static/js/reg_log.js"></script>
    <style>
        /*选项卡样式*/
        .one{
            width:50%;
            text-align: center;
            tab-size: 50px;
        }
        /* 登陆按钮样式*/
        .btn-login{
            width: 75%;
        }

        /*上边距调整*/
        .top_taable{
            margin-top: 5%;
        }
        /*整个登陆框架的样式*/
        .product-container {
            border-radius: 10px;
            background: #ffffff;
            margin-top: 10%;
            border:1px solid #000000;
        }

        .tab_body{
            width: 100%;
            text-align: center;
        }
        /* .imgSize{
             width: 200px;
             height: 60px;
         }
         .navbaraSize{
             height: 70px;
         }*/
        .logo {
            margin-left: 10px;
            margin-top:15px;
            padding-left: 15px;
            padding-right: 15px;
            float: left;
            height: 50px
        }
    </style>
</head>

<body>
<div class="header">
    <jsp:include page="/Head"/>
</div>
<div class="row tab_body">
    <div class="col-md-4"></div>
    <%--登录选项卡--%>
    <div class="tabbable col-md-4  product-container" id="login_table">
        <ul class="nav nav-tabs top_taable">
            <li class="active one"><a href="#teacher" data-toggle="tab" onclick="teach_form()">老师</a></li>
            <li class="one"><a href="#student" data-toggle="tab" onclick="student_form()">学生</a></li>
        </ul>

        <div class="tab-content">
            <%--老师登录界面--%>
            <div class="tab-pane active" id="teacher" >
                <form class="form-group" id="teachForm" method="post" >
                    <div class="form-group top_taable">
                        <label for="tphone"></label>
                        <input class="form-control" type="text" id="tphone" name="tphone"  placeholder="请输入教师手机号">
                    </div>
                    <div class="form-group">
                        <label for="tpassword"></label>
                        <input class="form-control" type="password"  id="tpassword" name="tpassword" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <div class="row text-center">
                            <div class="col-md-8 ">
                                <input class="form-control" id="t_verifycode" placeholder="验证码">
                                <span class="help-block"></span>
                            </div>
                            <div class="col-md-offset-4 ">
                                    <span onclick="changeImage_teacher()">
                                        <img src="/getVerifyCode" id="t_verifyCodeImage" width="70" height="35" onclick="changeImage_teacher()"> <a>刷新</a>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 text-left">
                            <a href="/Reg">点击注册</a>
                        </div>
                        <div class="col-md-4 text-right ">
                            <a href="#">忘记密码</a>
                        </div>
                    </div>
                    <div class="text-center ">
                        <input type="text" value="2" id="t_power" name="t_power" style="display:none"></input>
                        <button class="btn btn-primary btn-login" id="t_login" type="button" onclick="t_log_submit()">登录</button>
                    </div>
                </form>
            </div>


            <%--学生登陆界面--%>
            <div class="tab-pane" id="student">
                <form class="form-group" id="studentForm">
                    <div class="form-group top_taable">
                        <label for="sphone"></label>
                        <input class="form-control" type="text" id="sphone" name="sphone" placeholder="请输入学生手机">
                    </div>
                    <div class="form-group">
                        <label for="spassword"></label>
                        <input class="form-control" type="password" id="spassword" name="spassword" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <div class="row text-center">
                            <div class="col-md-8 ">
                                <input class="form-control" id="s_verifycode" placeholder="验证码">
                                <span class="help-block"></span>
                            </div>
                            <div class="col-md-offset-4 ">
                                    <span onclick="changeImage()">
                                        <img src="/getVerifyCode" id="s_verifyCodeImage" width="70" height="35" onclick="changeImage_student()"> <a>刷新</a>
                                    </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 text-left ">
                            <a href="/Reg">点击注册</a>
                        </div>
                        <div class="col-md-4 text-right ">
                            <a href="#">忘记密码</a>
                        </div>
                    </div>
                    <div class="text-center ">
                        <input type="text" value="3" id="s_power" name="s_power" style="display:none"></input>
                        <button class="btn btn-primary btn-login" id="slogin" type="button" onclick="s_log_submit()">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>


<div id="myModal" class="modal bs-example-modal-sm" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body" style="text-align: center">
                <h2>登录成功</h2>
            </div>
        </div>
    </div>
</div>
</body>
</html>