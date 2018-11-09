<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="mws-header" class="clearfix">

        <div id="mws-logo-container">
            <div id="mws-logo-wrap">
                <img src="images/main/icon.png" alt="mws admin" />
            </div>
        </div>

        <div id="mws-user-tools" class="clearfix">
            <!-- 通知 -->
            <div id="mws-user-notif" class="mws-dropdown-menu">
                <a href="#" class="mws-i-24 i-alert-2 mws-dropdown-trigger">Notifications</a>
                <span class="mws-dropdown-notif">36</span>
            </div>
            <!-- 邮件 -->
            <div id="mws-user-message" class="mws-dropdown-menu">
                <a href="#" class="mws-i-24 i-message mws-dropdown-trigger">Messages</a>
                <span class="mws-dropdown-notif">35</span>
            </div>
            <!-- 用户名 -->
            <div id="mws-user-info" class="mws-inset">
                <div id="mws-user-photo">
                    <img src="example/profile.jpg" alt="User Photo" />
                </div>
                <div id="mws-user-functions">
                    <div id="mws-username">
                        Hello, John Doe
                    </div>
                    <ul>
                        <li><a href="#">简况</a></li>
                        <li><a href="#">修改密码</a></li>
                        <li><a href="index-2.html">注销</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
