<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% pageContext.setAttribute("PATH", request.getContextPath());%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>主页页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="${PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
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
       .container .items{border: 1px solid #EEEEEE;padding: 10px;margin-bottom: 15px;}

       .logo {
           margin-left: -10px;
           margin-top:-15px;
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


<!--轮播图 -->
<!--轮播图布局 -->
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${PATH}/static/img/1.png" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="${PATH}/static/img/1.png" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="${PATH}/static/img/1.png" alt="Third slide">
                    </div>
                </div>
                <!-- 轮播（Carousel）导航 -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>
    </div>
</div>
<!--  分割线-->
<h3 class="text-center">--&nbsp;&nbsp;新 &nbsp;品 &nbsp;课&nbsp;程&nbsp;&nbsp;--</h3>
<br><!--  换行-->


<!--  分类-->

<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/yarn.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/react.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <!--可以让图片按比例缩放 -->
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/webpack.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
    </div>
</div>
<!--  分割线-->
<h3 class="text-center">--&nbsp;&nbsp;精 &nbsp;品 &nbsp;课&nbsp;程&nbsp;&nbsp;--</h3>
<br><!--  换行-->
<!--  分类-->

<div class="container">
    <div class="row">
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/codeguide.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/yarn.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/react.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
        <div class="col-lg-3 col-md-4">
            <div class="items text-center">
                <!--可以让图片按比例缩放 -->
                <img class="img-responsive" src="https://static.bootcss.com/www/assets/img/webpack.png?1507601668481" />

                <p>by @mdo</p>
                <p>Bootstrap 编码规范：编写灵活、稳定、高质量的 HTML 和 CSS 代码的规范。</p>
            </div>
        </div>
    </div>
</div>
</body>

</html>