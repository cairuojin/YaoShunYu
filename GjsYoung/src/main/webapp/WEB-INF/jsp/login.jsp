<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹(yaoteach)</title>
    <meta name="keywords" content="尧舜禹_yaoteach_让历史学习乐在其中，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link rel="stylesheet" href="css/login.css" />

</head>

<body>
<div class="login-container">
    <div>
        <a href="${pageContext.request.contextPath }/index"><img src="images/main/Logo.png" class="logoRegisterImg"></a>
        <br><br><br>
    </div>
    <h1>尧舜禹</h1>

    <div class="connect">
    <c:choose>
        <c:when test="${random == 0}">
            <p>不闻不若闻之，闻之不若见之，见之不若知之，知之不若行之。——荀子</p>
        </c:when>
        <c:when test="${random == 1}">
            <p>长风破浪会有时，直挂云帆济沧海。——李白</p>
        </c:when>
        <c:when test="${random == 2}">
            <p>三更灯火五更鸡，正是男儿读书时。——颜真卿</p>
        </c:when>
        <c:when test="${random == 3}">
            <p>纸上得来终觉浅，绝知此事要躬行。——陆游</p>
        </c:when>
        <c:when test="${random == 4}">
            <p>非学无以广才，非志无以成学。——诸葛亮</p>
        </c:when>
    </c:choose>
    </div>

    <form id="loginForm">
        <div>
            <input type="text" id="username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" id="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="login" type="button">登 录</button>
    </form>

    <a href="${pageContext.request.contextPath }/toRegister">
        <button type="button" class="register-tis">还没有账号？</button>
    </a>

</div>

<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

<script>
    $(document).ready(function() {
        //表单异步提交
        $("#login").on("click",function(){
            $.ajax({
                "async":true,
                "url":"${pageContext.request.contextPath}/login",	//传输路径
                "data":{"username":$("#username").val(),"password":$("#password").val()},  //传入后台的值 json对象
                "type":"POST",
                "success":function(data){
                    if(data == "true")
                        window.location.href="http://cairuojin.club/index";
                    else
                        alert("用户名或密码错误。");
                }

            })
        })
    })

</script>
</body>
</html>
