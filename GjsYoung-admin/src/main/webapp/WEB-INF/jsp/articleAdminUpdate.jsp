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


            <div class="mws-report-container clearfix">
                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-flag-red"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">文章id</span>
                            <span class="mws-report-value">${article.id}</span>
                        </span>
                </a>

                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-thumb-up"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">支持数</span>
                            <span class="mws-report-value">${article.support}</span>
                        </span>
                </a>

                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-thumb-down"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">反对数</span>
                            <span class="mws-report-value">${article.nonsupport}</span>
                        </span>
                </a>

                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-draw-smudge"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">点击数</span>
                            <span class="mws-report-value">${article.clicks}</span>
                        </span>
                </a>

                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-date-go"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">创建时间</span>
                            <span class="mws-report-value" style="font-size: 18px">
                                <fmt:formatDate value="${article.createtime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                            </span>
                        </span>
                </a>

                <a class="mws-report" style="width: 14%" href="#">
                    <span class="mws-report-icon mws-ic ic-date-edit"></span>
                    <span class="mws-report-content">
                        	<span class="mws-report-title">最后修改时间</span>
                            <span class="mws-report-value" style="font-size: 18px">
                                <fmt:formatDate value="${article.lastupdatetime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                            </span>
                        </span>
                </a>
            </div>

            <div class="mws-panel grid_8">
                <div class="mws-panel-header">
                    <span class="mws-i-24 i-list">文章修改</span>
                </div>
                <div class="mws-panel-body">
                    <!-- form表单 -->
                    <form class="mws-form">
                        <div class="mws-form-inline">
                            <div class="mws-form-row">
                                <label>标题</label>
                                <div class="mws-form-item small">
                                    <input type="text" class="mws-textinput" id="title" value="${article.title}"/>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>文章简介</label>
                                <div class="mws-form-item large">
                                    <textarea id="introduction">${article.introduction}</textarea>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>文章作者</label>
                                <div class="mws-form-item small">
                                    <select style="width: 130px">
                                        <option>Option 1</option>
                                        <option>Option 3</option>
                                        <option>Option 4</option>
                                        <option>Option 5</option>
                                    </select>
                                    <input type="text" id="authorid" class="mws-textinput" placeholder="直接填写作者id" value="${article.authorid}" style="width: 150px"/>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>文字状态</label>
                                <div class="mws-form-item clearfix">
                                    <ul class="mws-form-list inline" id="status">
                                        <li><input type="radio"/> <label>发表</label></li>
                                        <li><input type="radio"/> <label>暂停</label></li>
                                        <li><input type="radio"/> <label>置顶</label></li>
                                        <li><input type="radio"/> <label>删除</label></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mws-form-row">
                                <label>文章内容</label>
                                <div class="mws-form-item large">
                                    <%--<textarea readonly="readonly" id="content">${article.content}</textarea>--%>
                                    <textarea id="content">${article.content}</textarea>
                                    <div class="mws-form-message info">
                                        不允许直接修改，请到下方的富文本编辑器中编辑后点击提交，会自动修改此文本内容。
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="mws-button-row">
                            <input type="button" value="提交修改" class="mws-button red"
                                   onclick="updateArticle(${article.id},$('#title').val(),$('#introduction').val(),$('#authorid').val(),$('#status').val(),$('#content').val())"
                            />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

</div>

<jsp:include page="F-bottom.jsp"></jsp:include>
</div>
</body>
<script>
    function updateArticle (id,title, introduction, authorid, status, content) {
        $.ajax({
            "type":"POST",
            "url":"${pageContext.request.contextPath}/articleAdmin.updateMessage",	//传输路径
            "data":{
                "id":id,
                "title":title,
                "introduction":introduction,
                "authorid":authorid,
                "status":status,
                "content":content
            },
            "success":function(data){
                if( "OK" == data){
                    alert("信息修改成功");
                    window.location.reload();
                } else {
                    alert(data);
                }
            }
        })
    }
</script>
</html>
