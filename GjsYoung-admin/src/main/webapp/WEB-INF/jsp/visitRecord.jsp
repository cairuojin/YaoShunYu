<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <title>尧舜禹-后台管理系统</title>

    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>


    <script type="text/javascript" src="plugins/jquery.dataTables.js"></script>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="plugins/flot/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="plugins/colorpicker/colorpicker.js"></script>
    <script type="text/javascript" src="plugins/spinner/ui.spinner.js"></script>
    <script type="text/javascript" src="js/jquery-ui.js"></script>

    <script type="text/javascript" src="js/demo.js"></script>
    <script type="text/javascript" src="plugins/jimgareaselect/jquery.imgareaselect.min.js"></script>
    <script type="text/javascript" src="plugins/fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="plugins/sourcerer/Sourcerer-1.2.js"></script>
    <script type="text/javascript" src="plugins/jquery.validate.js"></script>





</head>
<body>

<jsp:include page="F-header.jsp"></jsp:include>
<div id="mws-wrapper">
    <!-- 左导航 -->
    <jsp:include page="F-left.jsp"></jsp:include>

    <div id="mws-container" class="clearfix">
        <div class="container">
            <div class="mws-panel grid_2">
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
                            <span>${todayTrend}%</span> 今日访问趋势
                        </li>
                        <li>
                            <span>${yesterdayTrend}%</span> 昨日访问趋势
                        </li>
                        <li>
                            <span>${todayAvgHour}</span> 今日每小时平均访问量
                        </li>
                        <li>
                            <span>${allAvgHour}</span> 总每小时平均访问量
                        </li>
                        <li>
                            <span>${thisweekAvgDay}</span> 一周内日平均访问量
                        </li>
                        <li>
                            <span>${allAvgDay}</span> 总日平均访问量
                        </li>
                        <li>
                            <span>${allCount}</span> 总访问量
                        </li>
                    </ul>
                </div>
            </div>

            <div class="mws-panel grid_6">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-table-1">最新访问记录</span>
                </div>
                <div class="mws-panel-body">
                    <table class="mws-table">
                        <thead>
                        <tr>
                            <th>session</th>
                            <th>ip</th>
                            <th>访问时间</th>
                            <th>国家</th>
                            <th>地区</th>
                            <th>城市</th>
                            <th>服务商</th>
                            <th>查询状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${visitLogs}" var="visitLog"  begin="0" end="10">
                        <tr class="gradeA">
                            <td>${visitLog.sid}</td>
                            <td>${visitLog.ip}</td>
                            <td><fmt:formatDate value="${visitLog.visittime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                            </td>
                            <td>${visitLog.country}</td>
                            <td>${visitLog.region}</td>
                            <td>${visitLog.city}</td>
                            <td>${visitLog.isp}</td>
                            <c:if test="${visitLog.errmessage == null}">
                                <td>成功</td>
                            </c:if>
                            <c:if test="${visitLog.errmessage != null}">
                                <td>${visitLog.errmessage}</td>
                            </c:if>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-table-1">访问记录表</span>
                </div>
                <div class="mws-panel-body">
                    <table class="mws-datatable-fn mws-table">
                        <thead>
                        <tr>
                            <th>session</th>
                            <th>ip</th>
                            <th>访问时间</th>
                            <th>国家</th>
                            <th>地区</th>
                            <th>城市</th>
                            <th>服务商</th>
                            <th>查询状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${visitLogs}" var="visitLog">
                            <tr class="gradeA">
                                <td>${visitLog.sid}</td>
                                <td>${visitLog.ip}</td>
                                <td><fmt:formatDate value="${visitLog.visittime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </td>
                                <td>${visitLog.country}</td>
                                <td>${visitLog.region}</td>
                                <td>${visitLog.city}</td>
                                <td>${visitLog.isp}</td>
                                <c:if test="${visitLog.errmessage == null}">
                                    <td>成功</td>
                                </c:if>
                                <c:if test="${visitLog.errmessage != null}">
                                    <td>${visitLog.errmessage}</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <jsp:include page="F-bottom.jsp"></jsp:include>
    </div>

</body>
</html>
