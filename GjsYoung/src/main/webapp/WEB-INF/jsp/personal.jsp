<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹(yaoteach)</title>
    <meta name="keywords" content="尧舜禹_yaoteach_让历史学习乐在其中，尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。">
    <meta name="description" content="吾生也有涯,而知也无涯。胸中有历史能让人“思接千载,视通万里”。尧舜禹-优秀历史学习平台，秉承传统精髓 丰富文化内涵尽在尧舜禹。我们更专业、更了解您的需求。">
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">
    <link href="css/personal.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="css/login.css" />
</head>


    <body style="background-color:rgba(0,0,0,0)">

        <jsp:include page="header.jsp"></jsp:include>

        <div class="login-container" id="price">
            <div class="container">
                <div class="price-main">
                    <div class="price-top">
                        <h3>个人中心</h3>
                        <c:choose>
                            <c:when test="${random == 0}">
                                <p>天生我材必有用，千金散尽还复来。——李白</p>
                            </c:when>
                            <c:when test="${random == 1}">
                                <p>惊涛拍岸，卷起千堆雪。江山如画，一时多少豪杰。——苏轼</p>
                            </c:when>
                            <c:when test="${random == 2}">
                                <p>有志不在年高，无志空活百岁。——石玉昆</p>
                            </c:when>
                            <c:when test="${random == 3}">
                                <p>痛饮狂歌空度日，飞扬跋扈为谁雄。——李白</p>
                            </c:when>
                            <c:when test="${random == 4}">
                                <p>自信人生二百年，会当击流三千里。——毛泽东</p>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="price-bottom">
                        <div class="col-md-3 price-grid">
                            <div class="price-block agile">
                                <br>
                                <h4>个人信息</h4>
                                <div class="price-gd-bottom">
                                    <div class="price-list">
                                        <form id="userForm" class="PersonalForm">
                                            <ul>
                                            <div class="personDiv">
                                                <li>昵称<input type="text" id="nickname" name="nickname" class="PersonalInput" placeholder="昵称" value="${user.nickname}"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>性别
                                                    <c:if test="${user.sex == 1}">
                                                        <input type="radio" name="radio" id="sex" class="personalSex" value="1" checked="checked">男
                                                    </c:if>
                                                    <c:if test="${user.sex != 1}">
                                                        <input type="radio" name="radio" id="sex" class="personalSex" value="1">男
                                                    </c:if>
                                                    <c:if test="${user.sex == 2}">
                                                        <input type="radio" name="radio" id="sex" class="personalSex" value="2" checked="checked">女
                                                    </c:if>
                                                    <c:if test="${user.sex != 2}">
                                                        <input type="radio" name="radio" id="sex" class="personalSex" value="2">女
                                                    </c:if>
                                                </li>
                                            </div>
                                            <div class="personDiv">
                                                <li>年龄<input type="text" id="age" name="age" class="PersonalInput" placeholder="年龄" value="${user.age}"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>手机<input type="text" id="phonenum" name="phonenum" class="PersonalInput" placeholder="手机号" value="${user.phonenum}"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>邮箱<input type="text" id="email" name="email" class="PersonalInput disableInput" placeholder="邮箱" value="${user.email}" disabled="disabled"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>心情<input type="text" id="moodTxt" name="moodTxt" class="PersonalInput" placeholder="心情" value="${user.moodTxt}"/></li>
                                            </div>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                                <div class="price-selet pric-sclr1">
                                    <a class="popup-with-zoom-anim" href="javascript:void(0);" onclick="updateMessage($('#nickname').val(),$('#sex').val(),$('#age').val(),$('#phonenum').val(),$('#moodTxt').val())">修改</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 price-grid">
                            <div class="price-block agile">
                                <br>
                                <h4>我的头像</h4>
                                <div class="price-gd-bottom">
                                    <div class="price-list">
                                        <div>
                                            <img src="${user.image}"  id="cropedBigImg" class="head-portrait"/>
                                        </div>
                                        <ul><li class="uploadTxt">上传新头像：</li></ul>
                                        <input type="file" id="chooseImage" name="chooseImage" class="uploadImage">
                                    </div>
                                </div>
                                <div class="price-selet pric-sclr1">
                                    <a class="popup-with-zoom-anim" href="javascript:void(0);" onclick="updateImage($('#chooseImage').val())">修改</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 price-grid">
                            <div class="price-block agile">
                                <br>
                                <h4>修改密码</h4>
                                <div class="price-gd-bottom">
                                    <div class="price-list">
                                        <form id="passwordForm" class="PasswordForm">
                                        <ul>
                                            <div class="personDiv">
                                                <li>用户名<input type="text" id="username" name="username" class="PersonalInput2 disableInput" placeholder="用户名" value="${user.username}" disabled="disabled"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>原始密码<input type="password" id="oldPassword" name="oldPassword" class="PersonalInput2" placeholder="原始密码"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>新的密码<input type="password" id="newPassword" name="newPassword" class="PersonalInput2" placeholder="新的密码"/></li>
                                            </div>
                                            <div class="personDiv">
                                                <li>确认密码<input type="password" id="newPasswordComfirm" name="newPasswordComfirm" class="PersonalInput2" placeholder="确认密码"/></li>
                                            </div>
                                        </ul>
                                        </form>
                                    </div>
                                </div>
                                <div class="price-selet pric-sclr1">
                                    <a class="popup-with-zoom-anim" href="javascript:void(0);" onclick="updatePassword($('#username').val(),$('#oldPassword').val(),$('#newPassword').val())">修改</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 price-grid">
                            <div class="price-block agile">
                                <br>
                                <h4>作者认证</h4>
                                <div class="price-gd-bottom">
                                    <div class="price-list">
                                        <form id="authorForm" class="AuthorForm">
                                        <ul>
                                            <div style="width: 250px">
                                                <c:if test="${authorApply == 'no' }">
                                                    <li> &nbsp;&nbsp;申请后您的昵称将变为真实姓名，且其他人不能修改为您的昵称。</li>
                                                </c:if>
                                                <c:if test="${authorApply != 'no' }">
                                                    <c:if test="${authorApply.status == 0}">
                                                        <li><h5 style="height: 30px">&nbsp;申请中&nbsp;</h5> </li>
                                                    </c:if>
                                                    <c:if test="${authorApply.status == 1}">
                                                        <li><h5 style="height: 30px">&nbsp;申请通过&nbsp;</h5> </li>
                                                    </c:if>
                                                    <c:if test="${authorApply.status == 2}">
                                                        <li><h5 style="height: 30px">&nbsp;申请驳回&nbsp;</h5> </li>
                                                    </c:if>
                                                </c:if>
                                             </div>
                                            <div class="personDiv">
                                                <c:if test="${authorApply == 'no'}">
                                                    <li>真实姓名<input type="text" id="realName" name="realName" class="PersonalInput3" placeholder="您的真实姓名"/></li>
                                                </c:if>
                                                <c:if test="${authorApply != 'no'}">
                                                    <li>真实姓名<input type="text" class="PersonalInput3" value="${authorApply.realname}" disabled="disabled"/></li>
                                                </c:if>
                                            </div>
                                            <div class="personDiv">
                                                <c:if test="${authorApply == 'no'}">
                                                    <li>身份证号码<input type="text" id="IDcardNum" name="IDcardNum" class="PersonalInput3" placeholder="身份证号码"/></li>
                                                </c:if>
                                                <c:if test="${authorApply != 'no'}">
                                                    <li>身份证号码<input type="text" class="PersonalInput3" value="${authorApply.idcardnum}" disabled="disabled"/></li>
                                                </c:if>
                                            </div>
                                            <div class="personDiv">
                                                <c:if test="${authorApply == 'no'}">
                                                    <li>认证文字<input type="text" id="authorIntroduction" name="authorIntroduction" class="PersonalInput3" placeholder="认证文字"/></li>
                                                </c:if>
                                                <c:if test="${authorApply != 'no'}">
                                                    <li>认证文字<input type="text" class="PersonalInput3" value="${authorApply.authorintroduction}" disabled="disabled"/></li>
                                                </c:if>
                                            </div>
                                            <div style="width: 250px;margin-top:18px"><li> &nbsp;&nbsp;客服处理需要时间，请您耐心等待。</li></div>
                                        </ul>
                                        </form>
                                    </div>
                                </div>
                                <div class="price-selet pric-sclr1">
                                    <a class="popup-with-zoom-anim" href="javascript:void(0);" onclick="applyAuthor($('#realName').val(),$('#IDcardNum').val(),$('#authorIntroduction').val())">修改</a>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>


        <jsp:include page="footer.jsp"></jsp:include>
    </body>
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<script src="js/jquery.validate.min.js?var1.14.0"></script>
<!-- 添加校验函数 -->
<script>
$(document).ready(function() {
    //添加自定义验证规则
    jQuery.validator.addMethod("phone_number", function(value, element) {
        var length = value.length;
        var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/
        return this.optional(element) || (length == 11 && phone_number.test(value));
    }, "手机号码格式错误");
    jQuery.validator.addMethod("IDCard", function(value, element) {
        var length = value.length;
        var IDCard = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;
        return this.optional(element) || (length == 15 && IDCard.test(value) || (length == 18 && IDCard.test(value)));
    }, "身份证号码格式错误");
    //添加修改密码校验
    $("#passwordForm").validate({
        rules:{
            oldPassword:{
                required:true,
            },
            newPassword:{
                minlength: 6, //最少2个字符
                maxlength: 20,//最多20个字符
            },
            newPasswordComfirm:{
                equalTo: "#newPassword"
            }
        },
        messages:{
            oldPassword:{
                required:"请输入您的密码",
            },
            newPassword:{
                minlength: "新密码最低6位哦！", //最少2个字符
                maxlength: "新密码最高20位哦！",//最多20个字符
            },
            newPasswordComfirm:{
                equalTo: "两次输入的密码不相同"
            }
        }
    });
    //信息校验
    $("#userForm").validate({
        rules: {
            nickname: {
                required: true,//必填
                minlength: 2, //最少2个字符
                maxlength: 20,//最多20个字符
                remote:{
                    url: "/checkExistAuthor",
                    type:"post",
                    data:{"nickname":function() {return $('#nickname').val();}}  //传入后台的值
                },
            },
            sex: {
                required: true,
            },
            age: {
                required: true,
                range: [0, 120],
            },
            phonenum: {
                required: true,
                phone_number: true,//自定义的规则
                digits: true,//整数
            },
            moodTxt:{
                maxlength: 20,//最多20个字符
            }
        },
        messages: {
            nickname: {
                required: "必须填写昵称",
                minlength: "昵称至少为2个字符",
                maxlength: "昵称至多为20个字符",
                remote:"该昵称已被认证过哦！"
            },
            sex: {
                required: "请选择您的性别哦。",
            },
            age: {
                required: "请填写您的年龄哦。",
                range: "请输入0-120之间的数字",
            },
            phonenum: {
                required: "请输入手机号码",
                digits: "请输入正确的手机号码",
            },
            moodTxt:{
                maxlength: "您的心情太长了"
            }
        }
    });
    //添加文件校验
    $('#chooseImage').on('change',function(){
        var filePath = $(this).val(),
            fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
            src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
        // 检查是否是图片
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            alert('上传错误,文件格式必须为：png/jpg/jpeg');
            return;
        }
        $('#cropedBigImg').attr('src',src);
    });
    //作者申请校验
    $("#authorForm").validate({
        rules:{
            realName:{
                required:true,
                minlength: 2, //最少2个字符
                maxlength: 10,//最多20个字符
            },
            IDcardNum:{
                IDCard:true
            },
            authorIntroduction:{
                minlength: 3, //最少2个字符
                maxlength: 10,//最多20个字符
            }
        },
        messages:{
            realName:{
                required:"必须填写认证名哦",
                minlength: "姓名至少为2个字符",
                maxlength: "姓名至多为10个字符",
            },
            IDcardNum:{
                IDCard:"身份证号码不对哦！"
            },
            authorIntroduction:{
                minlength: "认证文字至少为3个字符",
                maxlength: "认证文字至多为10个字符",
            }
        }
    });
});
</script>
<!-- 更新个人消息 -->
<script>
    function updateMessage(nickname,sex,age,phonenum,moodTxt) {
        if ($("#userForm").valid()){    //校验通过
            $.ajax({
                "type":"POST",
                "url":"${pageContext.request.contextPath}/updateMessage",	//传输路径
                "data":{
                    "nickname":nickname,
                    "sex":sex,
                    "age":age,
                    "phonenum":phonenum,
                    "moodTxt":moodTxt
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
    }
</script>
<!-- 更新个人头像 -->
<script>
    function updateImage(image){
        var fileFormat = image.substring(image.lastIndexOf(".")).toLowerCase()
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            alert('上传错误,文件格式必须为：png/jpg/jpeg');
            return;
        } else {
            var fileObj = $('#chooseImage')[0].files[0];
            var formFile = new FormData();
            formFile.append("action", "UploadVMKImagePath");
            formFile.append("file", fileObj); //加入文件对象
            var data = formFile;
            $.ajax({
                "type":"POST",
                "url":"${pageContext.request.contextPath}/updateImage",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data":data,
                "success":function(data){
                    if( "OK" == data){
                        alert("头像修改成功");
                        window.location.reload();
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>
<!-- 更新密码 -->
<script>
    function updatePassword(username,oldPassword,newPassword){
        if ($("#passwordForm").valid()){    //校验通过
            $.ajax({
                "type":"POST",
                "url":"${pageContext.request.contextPath}/updatePassword",	//传输路径
                "data":{
                    "username":username,
                    "oldPassword":oldPassword,
                    "newPassword":newPassword,
                },
                "success":function(data){
                    if( "OK" == data){
                        alert("密码修改成功，请重新登录！");
                        window.location.href = "/"
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>
<!-- 作者申请 -->
<script>
    function applyAuthor(realName, IDcardNum, authorIntroduction){
        if ($("#authorForm").valid()){    //校验通过
            $.ajax({
                "type":"POST",
                "url":"${pageContext.request.contextPath}/applyAuthor",	//传输路径
                "data":{
                    "realName":realName,
                    "IDcardNum":IDcardNum,
                    "authorIntroduction":authorIntroduction,
                },
                "success":function(data){
                    if( "OK" == data){
                        alert("申请成功，请您耐心等待！");
                        window.location.reload()
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>

</html>

