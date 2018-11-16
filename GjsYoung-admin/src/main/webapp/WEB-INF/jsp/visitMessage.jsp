<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <title>尧舜禹-后台管理系统</title>

    <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>


    <script type="text/javascript" src="plugins/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="plugins/flot/jquery.flot.pie.min.js"></script>

</head>
<body>

<jsp:include page="F-header.jsp"></jsp:include>
<div id="mws-wrapper">

    <!-- 左导航 -->
    <jsp:include page="F-left.jsp"></jsp:include>


    <div id="mws-container" class="clearfix">
        <div class="container">

            <!-- 折线图 -->
            <div class="mws-panel grid_4">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-graph">日时间段访问量趋势（访问量 / 时）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-line-chart1" style="width:100%; height:300px; "></div>
                    </div>

                </div>
            </div>

            <div class="mws-panel grid_4">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-graph">平均时间段访问量趋势（访问量 / 时）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-line-chart2" style="width:100%; height:300px; "></div>
                    </div>

                </div>
            </div>

            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-graph">月访问量趋势（访问量 / 日）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-line-chart3" style="width:100%; height:400px; "></div>
                    </div>

                </div>
            </div>

            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-graph">昨日访问来源（访问量 / 时）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-line-chart4" style="width:100%; height:400px; "></div>
                    </div>

                </div>
            </div>


            <div class="mws-panel grid_4">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-chart">访问区域分布（访问量及地区）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-pie-1" style="width:100%; height:300px; "></div>
                    </div>
                </div>
            </div>

            <div class="mws-panel grid_4">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-chart-2">访问时段分布（访问量及时间段）</span>
                </div>
                <div class="mws-panel-body">
                    <div class="mws-panel-content">
                        <div id="mws-pie-2" style="width:100%; height:300px; "></div>
                    </div>
                </div>
            </div>

        </div>


    <jsp:include page="F-bottom.jsp"></jsp:include>

</div>


</body>
<script>
    //折线图
    //日时间段
    $(function () {
        var yesterday = [], thisday = [], afterYesterday = [];
        thisday.push(${todayData});
        yesterday.push(${yesterdayData});
        afterYesterday.push(${afterYesterdayData});
        var plot = $.plot($("#mws-line-chart1"),
            [

                { data: afterYesterday, label: "前日平均曲线", color: "#d5a2b5" },
                { data: yesterday, label: "昨日访问曲线", color: "#77c78d"},
                { data: thisday, label: "今日访问曲线", color: "#0074d5" }
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
                    ticks:22,
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
    $("#mws-line-chart1").bind("plothover", function (event, pos, item) {  //鼠标移动事件
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

<script>
    //平均时间段
    $(function () {
        var avg30Data = [], avg7Data = [], avg3Data = [];
        avg30Data.push(${avg30Data});
        avg7Data.push(${avg7Data});
        avg3Data.push(${avg3Data});
        var plot = $.plot($("#mws-line-chart2"),
            [
                { data: avg30Data, label: "近30天平均曲线", color: "#d59862" },
                { data: avg7Data, label: "近7天曲线", color: "#7cc7bc"},
                { data: avg3Data, label: "近3天曲线", color: "#c75ea1"},
            ],
            {
                series: {
                    lines: {
                        show: true,
                    },
                    points: {
                        show: false,
                    },
                    fill: true,
                    clickable: true,      //允许监听鼠标点击事件
                    hoverable: true,         //允许监听鼠标悬停事件
                    shadowSize: 2               //阴影
                },
                xaxis: {
                    ticks:22,
                    position: "bottom"
                },yaxis: {
                    ticks: 10,  //格子数
                    position: "bottom"
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                },
                legend:{

                }
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
    $("#mws-line-chart2").bind("plothover", function (event, pos, item) {  //鼠标移动事件
        if (item) {
            var x = item.datapoint[0].toFixed(2),
                y = item.datapoint[1].toFixed(2);
            $("#tooltip").html(item.series.label + " " + parseInt(x) + "时,平均访问量：" + parseInt(y))
                .css({top: item.pageY+5, left: item.pageX+5})
                .fadeIn(200);
        } else {
            $("#tooltip").hide();
        }
    });
</script>

<script>
    //月趋势段
    $(function () {
        var thisMonthData = [], LastMonthData = [], afterLastMonthData = [];
        thisMonthData.push(${thisMonthData});
        LastMonthData.push(${LastMonthData});
        afterLastMonthData.push(${afterLastMonthData});
        var plot = $.plot($("#mws-line-chart3"),
            [
                { data: afterLastMonthData, label: new Date().getMonth()-1 + "月访问趋势", color: "#c0c7c7"},
                { data: LastMonthData, label: new Date().getMonth() + "月访问趋势", color: "#bfc74e"},
                { data: thisMonthData, label: new Date().getMonth()+1 + "月访问趋势", color: "#d52071" }
            ],
            {
                series: {
                    lines: {
                        show: true,
                    },
                    points: {
                        show: true,
                    },
                    fill: true,
                    clickable: true,      //允许监听鼠标点击事件
                    hoverable: true,         //允许监听鼠标悬停事件
                    shadowSize: 2               //阴影
                },
                xaxis: {
                    ticks:24,
                    position: "bottom"
                },yaxis: {
                    ticks: 10,  //格子数
                    position: "left"
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                },

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
    $("#mws-line-chart3").bind("plothover", function (event, pos, item) {  //鼠标移动事件
        if (item) {
            var x = item.datapoint[0].toFixed(2),
                y = item.datapoint[1].toFixed(2);
            $("#tooltip").html(item.series.label + " " + parseInt(x) + "号,访问量：" + parseInt(y))
                .css({top: item.pageY+5, left: item.pageX+5})
                .fadeIn(200);
        } else {
            $("#tooltip").hide();
        }
    });
</script>

<script>
    //柱状图段
    $(function () {
        var yesterday = [], yesterdayChina = [],yesterdayNotChina = [];
        yesterday.push(${yesterdayData});
        yesterdayChina.push(${yesterdayChinaData});
        yesterdayNotChina.push(${yesterdayNotChinaData});


        $.plot($("#mws-line-chart4"), [
                {data:yesterday,label: "昨日访问量", color: "#c76b57"},
                {data:yesterdayChina, label: "国内访问量", color: "#59c75d"},
                {data:yesterdayNotChina, label: "海外访问量", color: "#5f94c7"}
        ],

            {
            series: {
                lines: { show: false, fill: true, steps: false },
                bars: { show: true, barWidth: 0.4 },
                clickable: true,      //允许监听鼠标点击事件
                hoverable: true,         //允许监听鼠标悬停事件
            },
            xaxis: {
                ticks: 20,
            },
            grid: {
                hoverable: true,
                clickable: true,
            },
        });
        $("<div id='tooltip'></div>").css({
            position: "absolute",
            display: "none",
            border: "1px solid #fdd",
            padding: "2px",
            "background-color": "#fee",
            opacity: 0.80
        }).appendTo("body");
        $("#mws-line-chart4").bind("plothover", function (event, pos, item) {  //鼠标移动事件
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
    });
</script>

<script>
    $(function () {
        var tempTimeData = [        //饼图的数据
            <c:forEach items="${tempTimeData}" var="map">
                {label: "${map.temptime}<br>${map.count}", data: ${map.count}},
            </c:forEach>
        ];
        var regionData = [        //饼图的数据
            <c:forEach items="${regionData}" var="map">
            {label: "${map.region} ${map.count}", data: ${map.count}},
            </c:forEach>
        ];

        $.plot($("#mws-pie-1"),
            regionData, {
                series: {
                    pie: {
                        show: true,
                        combine: {
                            color: "#42990d",
                            label: '国内其他地区',
                            threshold: 0.01
                        }
                    },
                    clickable: true,      //允许监听鼠标点击事件
                    hoverable: true,         //允许监听鼠标悬停事件
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                },
            });

        $.plot($("#mws-pie-2"),
            tempTimeData, {
                series: {
                    pie: {
                        show: true
                    },
                    clickable: true,      //允许监听鼠标点击事件
                    hoverable: true,         //允许监听鼠标悬停事件
                },
                grid: {
                    hoverable: true,
                    clickable: true,
                },
                legend: {
                    show:false
                }
            });
        $("<div id='tooltip'></div>").css({
            position: "absolute",
            display: "none",
            border: "1px solid #fdd",
            padding: "2px",
            "background-color": "#fee",
            opacity: 0.80
        }).appendTo("body");
        $("#mws-pie-1").bind("plothover", function (event, pos, item) {  //鼠标移动事件
            if (item) {
                var percent = parseFloat(item.series.percent).toFixed(2);
                $("#tooltip").html(item.series.label + " " + percent + "%")
                    .css({top: pos.pageY+5, left: pos.pageX+5})
                    .fadeIn(200);
            } else {
                $("#tooltip").hide();
            }
        });
        $("#mws-pie-2").bind("plothover", function (event, pos, item) {  //鼠标移动事件
            if (item) {
                var percent = parseFloat(item.series.percent).toFixed(2);
                $("#tooltip").html(item.series.label + " " + percent + "%")
                    .css({top: pos.pageY+5, left: pos.pageX+5})
                    .fadeIn(200);
            } else {
                $("#tooltip").hide();
            }
        });
    });


</script>
</html>
