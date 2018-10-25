    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta name="baidu-site-verification" content="BgzDAdNjvW" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link rel="stylesheet" href="css/index.css"/>
</head>

<body>


<jsp:include page="header.jsp"></jsp:include>


<div class="banner banner-bg">


    <!-- banner-grids -->
    <div class="banner-grids">
        <!-- container -->
        <div class="container">
            <div style="margin:100px auto;width: 400px;height: 400px"  class="IndexLogo">
                <img src="images/30.png" id="pic" style="display:none">
            </div>
            <div class="banner-top-grids">
                <div class="top-grids">
                    <div class="col-md-6 banner-grid" style="padding-right: 25px;padding-left: 25px;">
                        <div class="banner-left-grid blue">
                            <div class="banner-left-icon">
                                <div class="services-icon">
                                    <span class="glyphicon glyphicon-glass" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="banner-grid-info">
                                <h3 style="font-family: 微软雅黑;">以史为鉴 指导未来</h3>
                                <p style="font-family: 微软雅黑;">高瞻才能远瞩，我们懂得几千年来的历史发展规律，才能更好地预判现今社会发展的趋向，也就能够让自己更好地顺应时代发展的潮流。
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="col-md-6 banner-grid">
                        <div class="banner-left-grid green">
                            <div class="banner-left-icon">
                                <div class="services-icon">
                                    <span class="glyphicon glyphicon-glass glyphicon-cog" aria-hidden="true"></span>
                                </div>
                            </div>
                            <div class="banner-grid-info">
                                <h3 style="font-family: 微软雅黑;">启发智能 感动人心</h3>
                                <p style="font-family: 微软雅黑;">书有古今，智慧没有古今。如果想让自己的智慧更加充实而锐利，那么学习历史是最简单的快捷方式。古人们的智慧，才是我们应该活用的宝贵资产。
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="welcome" style="background-image: url(/images/main/leaves2.png);width: 100%">
    <!-- container -->
    <div class="container">
        <div class="welcome-info">
            <div class="bigTitle">尧舜禹</div>
            <h5 style="font-family: 微软雅黑;">吾生也有涯，而知也无涯。——庄子</h5>
            <p style="font-family: 微软雅黑;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;胸中有历史能让人“思接千载，视通万里”。历史记载着人类过去的兴衰成败，每一个被记录的历史事件，都不是简单的花开花落，而是蕴含着复杂的因果。因此，我们通过对历史长河的纵观，从历朝历代政权的更迭、家族的兴衰、个人的荣辱等等，能够总结出丰富厚重的经验教训，从而给我们自身以训诫和启发。</p>
        </div>
    </div>
</div>
<div style="background: url(/images/main/background.jpg);border-top: 1px solid #d4faff">
    <div class="work">
        <!-- container -->
        <div class="container">
            <div class="recommend" align="center">
                <a class="recommendFont" href="${pageContext.request.contextPath }/celebrity?page=1">推荐历史人物</a>
            </div>
            <div class="work-grids">
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-left" style="border-radius: 50px 0px 0px 0px;">
                        <h5>曹操</h5>
                        <p>人称：治世之能臣，乱世之奸雄。<br>英雄不畏孤胆，作为一代奸雄的曹操，却被后人骂了几千年!文治武功，雄才大略的曹操确是当时不可多得人才!</p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/1">了解更多</a>
                    </div>
                    <div class="col-md-4 work-grid-middle" style="padding-right: 0;padding-left: 0;">
                        <a href="#"><img src="images/index/caocao.png"></a>
                    </div>
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 50px 0px 0px;">
                        <h5>朱元璋</h5>
                        <p>我本淮右布衣，天下与我何加焉。<br>朱元璋是中国历史上最杰出的君主之一。<br>一生勤于政事，建树颇多，创设了大量的制度典章，打下明朝近三百年基业。</p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/52">了解更多</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-middle" style="padding-right: 0;padding-left: 0;">
                        <img src="images/index/qinshihuang.png">
                    </div>
                    <div class="col-md-4 work-grid-left">
                        <h5>李世民</h5>
                        <p>太宗文武之才，高出前古。<br>盖三代以还，中国之盛未之有也。<br>唐太宗李世民是中国古代历史上的一位伟大政治家、书法家，卓越的领袖、影响中华乃至世界进程的杰出人物，他任用贤能，选贤任能，从善如流，闻过即改。</p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/40">了解更多</a>
                    </div>
                    <div class="col-md-4 work-grid-middle"  style="padding-right:0;padding-left:0;">
                        <img src="images/index/lishiming.png">
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="work-grids-top">
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 0px 0px 50px;">
                        <h5>秦始皇</h5>
                        <p>千古一帝震古烁今，独统天下霸道失心。<br>他重用人才，统一六国，南征越族，北击匈奴，结束了诸侯割据的分裂局面，建立我国历史上第一个统一的多民族的封建国家。</p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/18">了解更多</a>
                    </div>
                    <div class="col-md-4 work-grid-middle" style="padding-right: 0;padding-left: 0;border-radius: 0px 0px 100px 0px;">
                        <img src="images/index/wuzetian.png" style="height: 348px;">
                    </div>
                    <div class="col-md-4 work-grid-left" style="border-radius: 0px 0px 50px 0px;">
                        <h5>武则天</h5>
                        <p>功过论争千秋去，无字碑上遍诗文。<br>她是中国历史上唯一的一位女皇帝，她的一生，是辉煌的一生，是令人艳羡的一生；然而又是艰难的一生，孤独寂寞的一生。</p>
                        <a href="${pageContext.request.contextPath }/celebrityDetail/41">了解更多</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="news">
        <!-- container -->
        <div class="container">
            <div class="recommend" align="center">
                <a class="recommendFont" href="${pageContext.request.contextPath }/atricle?page=1">推荐历史文章</a>
            </div>
            <div class="news-grids">
                <div class="col-md-6 news-grid">
                    <img src="images/index/yongantuogu.png" class="articleImg"/>
                    <div class="news-grid-info">
                        <a href="${pageContext.request.contextPath }/articleDetail/103">永安托孤</a>
                        <p class="date">2018-09-11 16:26:08</p>
                        <p class="text">&nbsp;&nbsp;&nbsp;&nbsp;刘备在弥留之际把自己的儿子刘禅托付给诸葛亮，这就是著名的“永安托孤”，后人常把这看作是刘备的忠厚和对诸葛亮的信任。可是也有人认为，这是刘备的狡诈，
                            是为了防止诸葛亮专权、篡权，而给诸葛亮套上的一副精神枷锁。那么刘备的托孤究竟是体现刘备的仁义，
                            还是刘备的诡诈呢？敬请关注《易中天品三国》之——永安托付。</p>
                    </div>
                </div>
                <div class="col-md-6 news-grid" style="margin-bottom: 80px">
                    <img src="images/index/libaihedufu.png" class="articleImg"/>
                    <div class="news-grid-info">
                        <a href="${pageContext.request.contextPath }/articleDetail/20">李白与杜甫：唐诗里的兄弟之情</a>
                        <p class="date">2018-09-11 16:42:31</p>
                        <p class="text">&nbsp;&nbsp;&nbsp;&nbsp;他们一个是诗仙，一个是诗圣，都是中国诗歌史上泰山北斗级的人物。 李白被举为“仙”，这“仙”对天下大事多有关注；杜甫被尊为“圣”，这“圣”对廊庙之外也多有牵挂。
                            更传奇的是，李白和杜甫这样百年不遇的诗歌奇才，竟然是生活在同一个时空下的同龄人。而更不可思议的是，
                            他们之间还有过交往，并留下了一段为后人称道的伟大友谊。</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //container -->
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
<script>
    $(function(){
        $("#pic").fadeToggle(3000);
    });
    function fadeOutDisplay() {
        $("#pic").fadeOut(1000);
    }
    function fadeInDisplay() {
        $("#pic").fadeIn(1000);
    }
</script>
</html>
