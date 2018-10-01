<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹-博古通今</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <script type="text/javascript" src="../js/jquery-2.2.4.min.js"></script>
</head>

<body>
<h3>新增任务</h3>
人物ID：<input id="celebrityId">
标题：<input id="title">
内容：<textarea name="content" id="content" cols="30" rows="10"></textarea>
图片地址：<input id="image">
<button id="addButton" onclick="add( $('#celebrityId').val(), $('#title').val(), $('#content').val(),$('#image').val() )">添加</button>
<hr style="height:1px;border:none;border-top:1px solid #555555;" />
<h3>任务列表：</h3>
<c:forEach items="${celebrityDetails}" var="celebrityDetail">
    ${celebrityDetail.celebrityid}&nbsp;&nbsp;${celebrityDetail.title}&nbsp;&nbsp;
    <div style="width: 1000px">
            ${celebrityDetail.content}&nbsp;&nbsp;
    </div>
</c:forEach>



</body>
<script>
    function add(celebrityId,title, content, image) {
        var des = content;
        alert(des);
        $.ajax({
            "url":"${pageContext.request.contextPath}/admin/addcelebrity?celebrityid=" + celebrityId + "&title=" + title + "&content=" + encodeURIComponent(des) + "&image=" + image,
            "success":function(data){		//创建成功
                if("OK"==(data)){
                    alert("新建成功");
                    window.location.reload();
                }
                else
                {
                    alert(data);
                }
            }
        })
    }
</script>
</html>
