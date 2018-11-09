<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <title>尧舜禹-后台管理系统</title>
    <!-- Required Stylesheets -->
    <link rel="stylesheet" type="text/css" href="css/fluid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/mws.style.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="css/icons/icons.css" media="screen" /> <!-- 左边 -->


    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>

    <script type="text/javascript" src="plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="plugins/jquery.dataTables.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="plugins/colorpicker/colorpicker.js"></script>
    <script type="text/javascript" src="plugins/sourcerer/Sourcerer-1.2.js"></script>
    <script type="text/javascript" src="plugins/jquery.validate.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>


</head>

<body>

<jsp:include page="F-header.jsp"></jsp:include>
<div id="mws-wrapper">
    <div id="mws-sidebar-stitch"></div>

    <!-- 背景 -->
    <div id="mws-sidebar-bg"></div>

    <!-- 左导航 -->
    <jsp:include page="F-left.jsp"></jsp:include>

    <div id="mws-container" class="clearfix">
        <div class="container">
            <!-- 上面 -->
            <div class="mws-report-container clearfix">
                <a class="mws-report" href="#">
                    <span class="mws-report-icon mws-ic ic-attribution"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">人物百科数</span><br>
                            <span class="mws-report-value">${celebrityNum}</span>
                        </span>
                </a>
                <a class="mws-report" href="#">
                    <span class="mws-report-icon mws-ic ic-application-view-icons"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">文言文数</span><br>
                            <span class="mws-report-value">${classicalNum}</span>
                        </span>
                </a>
                <a class="mws-report" href="#">
                    <span class="mws-report-icon mws-ic ic-billiard-marker"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">文章数</span><br>
                            <span class="mws-report-value">${articleNum}</span>
                        </span>
                </a>
                <a class="mws-report" href="#">
                    <span class="mws-report-icon mws-ic ic-script-go"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">昨日访问趋势</span><br>
                            <c:if test="${yesterdayTrend >= 0}">
                                <span class="mws-report-value up">${yesterdayTrend}</span>
                            </c:if>
                            <c:if test="${yesterdayTrend < 0}">
                                <span class="mws-report-value down">${yesterdayTrend}</span>
                            </c:if>
                        </span>
                </a>
                <a class="mws-report" href="#">
                    <span class="mws-report-icon mws-ic ic-script-lightning"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">今日访问趋势</span><br>
                            <c:if test="${todayTrend >= 0}">
                                <span class="mws-report-value up">${todayTrend}</span>
                            </c:if>
                            <c:if test="${todayTrend < 0}">
                                <span class="mws-report-value down">${todayTrend}</span>
                            </c:if>
                        </span>
                </a>
                <div style="margin:8px 1%;">
                    注：访问趋势为：（该天 / 前一天） - 1
                </div>
            </div>


            <!-- 折线图 -->
            <div class="mws-panel grid_5">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-graph">时间段访问量</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-line-chart" style="width:100%; height:215px; "></div>
                    </div>
                </div>
            </div>

            <div class="mws-panel grid_3">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-books-2">访问量概要</span>
                </div>
                <div class="mws-panel-body">
                    <ul class="mws-summary">
                        <li>
                            <span>${todayVisitNum}</span> 今日访问量
                        </li>
                        <li>
                            <span>${yesterdayVisitNum}</span> 昨日访问量
                        </li>
                        <li>
                            <span>${beforeYesterdayVisitNum}</span> 前日访问量
                        </li>
                        <li>
                            <span>${avgWeekVisitNum}</span> 近一周平均访问量
                        </li>
                        <li>
                            <span>${avgMonthVisitNum}</span> 近30天平均访问量
                        </li>
                        <li>
                            <span>${totalVisitNum}</span> 总访问量
                        </li>
                    </ul>
                </div>
            </div>

            <div class="mws-panel grid_8 mws-collapsible">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-table-1">版本更新日志</span>
                </div>
                <div class="mws-panel-body">
                    <table class="mws-table">
                        <thead>
                        <tr>
                            <th>日期</th>
                            <th>版本号</th>
                            <th>更新内容</th>
                            <th>更新人员</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="gradeA">
                            <td>Gecko</td>
                            <td>Netscape 7.21</td>
                            <td>Win 95+ / Mac OS 8.6-9.2</td>
                            <td class="center">1.7</td>
                        </tr>
                        <tr class="gradeA">
                            <td>Gecko</td>
                            <td>Netscape 7.2</td>
                            <td>Win 95+ / Mac OS 8.6-9.2</td>
                            <td class="center">1.7</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- End Main Container -->

        <jsp:include page="F-bottom.jsp"></jsp:include>

    </div>

</div>


</body>
<script>
    //折线图
    $(function () {
        var yesterday = [], thisday = [], avgday = [];
        thisday.push(${todayData});
        yesterday.push(${yesterdayData});
        // avgday.push([1,3],[14, 3],[16, 4],[24, 1]);
        var plot = $.plot($("#mws-line-chart"),
            [
                { data: yesterday, label: "昨日访问曲线", color: "#32c753"},
                { data: thisday, label: "今日访问曲线", color: "#d55360" },
                // { data: avgday, label: "平均访问曲线", color: "#45b9d5" }
            ],
            {
                series: {
                    lines: { show: true },
                    points: { show: true },
                    clickable: true      ,      //允许监听鼠标点击事件
                    hoverable: true   ,         //允许监听鼠标悬停事件
                    shadowSize: 5               //阴影
                },
                xaxis: {
                    ticks:12,
                },yaxis: {
                    ticks: 10,  //格子数
                },
                grid: { hoverable: true, clickable: true }
            });
    });

    $("<div id='tooltip'></div>").css({
        position: "absolute",
        display: "none",
        border: "1px solid #fdd",
        padding: "2px",
        "background-color": "#fee",
        opacity: 0.80
    }).appendTo("body");
    $("#mws-line-chart").bind("plothover", function (event, pos, item) {  //鼠标移动事件
        if (item) {
            var x = item.datapoint[0].toFixed(2),
                y = item.datapoint[1].toFixed(2);
            $("#tooltip").html(item.series.label + " " + parseInt(x) + "时,访问量：" + parseInt(y))
                .css({top: item.pageY+5, left: item.pageX+5})
                .fadeIn(200);
        } else {
            $("#tooltip").hide();
        }
    });
</script>
</html>
