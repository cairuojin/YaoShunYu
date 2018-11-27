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
            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-table-1">文章列表</span>
                </div>
                <div class="mws-panel-body">
                    <table class="mws-datatable-fn mws-table">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>简介</th>
                            <th>作者id</th>
                            <th>作者昵称</th>
                            <th>点赞数</th>
                            <th>反对数</th>
                            <th>点击数</th>
                            <th>状态</th>
                            <th>缩略图</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${articleVos}" var="articleVo">
                            <tr class="gradeA">
                                <td>${articleVo.id}</td>
                                <td>${articleVo.title}</td>
                                <td>${articleVo.introduction}</td>
                                <td>${articleVo.authorid}</td>
                                <td>${articleVo.nickname}</td>
                                <td>${articleVo.support}</td>
                                <td>${articleVo.nonsupport}</td>
                                <td>${articleVo.clicks}</td>
                                <c:if test="${articleVo.status == 0}">
                                    <td>发表</td>
                                </c:if>
                                <c:if test="${articleVo.status == 1}">
                                    <td>置顶</td>
                                </c:if>
                                <c:if test="${articleVo.status == 2}">
                                    <td>删除</td>
                                </c:if>
                                <c:if test="${articleVo.status == 3}">
                                    <td>暂停</td>
                                </c:if>
                                <td><img src="${articleVo.image}"></td>
                                <td><fmt:formatDate value="${articleVo.createtime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </td>
                                <td><fmt:formatDate value="${articleVo.lastupdatetime}"
                                                    pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath }/articleAdmin.update?id=${articleVo.id}" title="修改">
                                        <li class="mws-ic-16 ic-application-key"></li>
                                    </a>
                                    <a href="${pageContext.request.contextPath }/articleAdmin.stop?id=${articleVo.id}" title="暂停">
                                        <li class="mws-ic-16 ic-shape-square"></li>
                                    </a>
                                    <a href="${pageContext.request.contextPath }/articleAdmin.delete?id=${articleVo.id}" title="删除">
                                        <li class="mws-ic-16 ic-cross-octagon"></li>
                                    </a>
                                </td>
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
