<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹_开卷有益</title>
    <meta name="keywords" content="尧舜禹_yaoteach_开卷有益_文言能力提升，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link href="css/classical.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
</head>

<body style="background: url(images/main/background.jpg)">

<jsp:include page="header.jsp"></jsp:include>
<div id="content">
    <div class="clearfix"></div>
    <div class="mainContent">
        <section>
            <article class="blogPost wow animate fadeInUp">
                <header>
                    <h2 class="classicalTitle">${classical.title}</h2>
                </header>
                <div style="margin-top: 20px">
                    <p>${classical.content}</p>
                </div>
                <div style="margin-top: 50px;">
                    <img src="${classical.image}" class="classicalImg">
                </div>
            </article>
        </section>
        <div style="margin-top: 50px">
            <c:forEach items="${classicalDetails}" var="classicalDetail" varStatus="i">
                <div class="wow animate fadeInUp">
                    <div style="float: left;">${i.index+1}、</div>${classicalDetail.question}
                    <div style="height: 100px;">
                        <div class="answer " style="display: none;">
                            <div style="float:left;margin-top: 30px;color: #0031e2">答案 : &nbsp;</div>
                            <div style="clear: both; margin-top: 30px;margin-bottom: 30px">${classicalDetail.answer}</div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="wow animate fadeInUp">
            <input type="button" value="显示答案" id="btnShow"/>
        </div>

        <div style="margin-top: 50px;margin-bottom: 30px" class="wow animate fadeInUp">
            <div style="float: left;font-size: 30px">原文翻译：</div><br>
            <div style="margin-top: 20px"><p>${classical.translation}</p></div>
        </div>
    </div>
    <div style="text-align: center;margin-top: 50px;margin-bottom: 50px" class="wow animate fadeInUp">
        <p style="font-size: 30px">您觉得这篇文章难度如何？</p>
        <input type="button" id="hard" value="太难了" style="margin-right: 20px;height: 40px">
        <input type="button" id="easy" value="很简单" style="height: 40px">
    </div>

</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>

    $("#btnShow").click(function () {
        //点击按钮显示答案
        // $(".answer").removeClass("answerHidden");
        // $(".answer").addClass("answerVisible");
        //判断是否已显示，为block表示已显示，需要隐藏
        if("block"==$(".answer").css("display")){
            $(".answer").fadeOut(2000);//缓慢隐藏
            $("#btnShow").val("显示答案");
        }else {
            $(".answer").fadeIn(2000);//缓慢显示
            $("#btnShow").val("隐藏答案");
        }
    });

</script>
</html>