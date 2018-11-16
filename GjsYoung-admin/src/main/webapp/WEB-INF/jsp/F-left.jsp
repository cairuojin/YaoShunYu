<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/icons/icons.css" media="screen"/> <!-- 左边 -->


</head>
<div id="mws-sidebar-stitch"></div>

<!-- 背景 -->
<div id="mws-sidebar-bg"></div>
<div id="mws-sidebar">
    <!-- 搜索框 -->
    <div id="mws-searchbox" class="mws-inset">
        <form action="http://www.malijuwebshop.com/themes/mws-admin/dashboard.html">
            <input type="text" class="mws-search-input"/>
            <input type="submit" class="mws-search-submit"/>
        </form>
    </div>
    <!-- 导航 -->
    <div id="mws-navigation">
        <ul>
            <c:if test="${pageHeader == 0}">
                <li style="background-color:#5d897e"><a href="${pageContext.request.contextPath }/index"
                                                        class="mws-i-24 i-home">主页</a></li>
            </c:if>
            <c:if test="${pageHeader != 0}">
                <li><a href="${pageContext.request.contextPath }/index" class="mws-i-24 i-home">主页</a></li>
            </c:if>
            <c:if test="${pageHeader == 1}">
                <li style="background-color:#5d897e"><a href="${pageContext.request.contextPath }/visitMessage" class="mws-i-24 i-chart">访问量信息</a></li>
            </c:if>
            <c:if test="${pageHeader != 1}">
                <li><a href="${pageContext.request.contextPath }/visitMessage" class="mws-i-24 mws-i-24 i-chart">访问量信息</a></li>
            </c:if>
            <c:if test="${pageHeader == 2}">
                <li style="background-color:#5d897e"><a href="${pageContext.request.contextPath }/visitRecord" class="mws-i-24 i-table-1">访问记录</a></li>
            </c:if>
            <c:if test="${pageHeader != 2}">
                <li><a href="${pageContext.request.contextPath }/visitRecord" class="mws-i-24 i-table-1">访问记录</a></li>
            </c:if>
            <c:if test="${pageHeader == 3}">
                <li style="background-color:#5d897e"><a href="${pageContext.request.contextPath }/calendar" class="mws-i-24 i-day-calendar">日历纪要</a></li>
            </c:if>
            <c:if test="${pageHeader != 3}">
                <li><a href="${pageContext.request.contextPath }/calendar" class="mws-i-24 i-day-calendar">日历纪要</a></li>
            </c:if>
            <li>
                <a href="#" class="mws-i-24 i-list">博古通今</a>
                <ul>
                    <li><a href="form_elements.html">人物录入</a></li>
                    <li><a href="form_elements.html">人物内容录入</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="mws-i-24 i-list">开卷有益</a>
                <ul>
                    <li><a href="form_elements.html">文言文录入</a></li>
                    <li><a href="form_elements.html">文言文列表</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="mws-i-24 i-list">鸾翔凤集</a>
                <ul>
                    <li><a href="#" class="mws-i-24 i-list">文章录入</a></li>
                    <li><a href="form_elements.html">作者录入</a></li>
                    <li><a href="form_elements.html">作者申请处理</a></li>
                </ul>
            </li>
            <li>
                <a href="#" class="mws-i-24 i-list">觥筹交错</a>
                <ul>
                    <li>
                        <a href="#" class="mws-i-24 i-list">人脸融合</a>
                        <ul>
                            <li><a href="">融合图管理</a></li>
                            <li><a href="">用户上传列表</a></li>
                        </ul>
                    </li>
                    <li><a href="">其他</a></li>
                    <li><a href="form_elements.html">其他</a></li>
                </ul>
            </li>
            <li>
                <a href="widgets.html" class="mws-i-24 i-cog">个人中心</a>
                <ul>
                    <li><a href="form_elements.html">用户列表</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
</html>
