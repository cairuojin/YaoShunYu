<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>尧舜禹-觥筹交错</title>
    <link rel="icon" href="images/main/icon.jpg" type="image/x-icon">

    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>

    <link rel="stylesheet" href="/css/swiper.min.css">
    <link href="/css/entertainmentDetail.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>
    <div class="banner-bottom pt-section" data-name="about" id="ptsection-two"style="background-size:cover;background-image: url(/images/main/entertainment2.png);height: 400px;border:1px solid #CCCCCC;">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="section_heading">
                        <div class="myTitle1">
                            <div class="imabackground1"></div>
                            <div>粉墨登场</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="background: url(/images/main/background.jpg)">

        <div style="height: 360px;margin:0 auto;text-align: center;width:80%;background-color: rgba(192,209,255,0.20)">
            <div class="clearfix"></div>
            <h3 style=" margin-top: 80px">功能简介</h3>
            <hr>
            <h4>看看您穿上古装的形象，即刻过一把穿越瘾吧。</h4>
            <p>该功能是基于Face++人脸识别功能实现，可以对模板图和融合图中的人脸进行融合操作。融合后的图片中将包含融合图中的人脸特征，以及模板图中的其他外貌特征与内容。</p>
            <img src="images/main/click.png" style="margin-top: 20px">
        </div>

        <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
        <div style="width:80%;margin:0 auto;background-color: rgba(192,209,255,0.20)">
                <div style="width: 800px;font-size: 0;margin: 0 auto;text-align: center" >
                    <div style="text-align: center">
                        <div style="display: inline-block;margin-right: 30px;vertical-align: top">
                            <div><h3 style="text-align: center">选择模板</h3></div>
                            <div class="swiper-container gallery-top1">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${images}" var="image">
                                        <div class="swiper-slide" id="image${image.id}" style="background-image:url(${image.image})"></div>
                                    </c:forEach>
                                </div>
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                            <div class="swiper-container gallery-thumbs">
                                <div class="swiper-wrapper">
                                    <c:forEach items="${images}" var="image">
                                        <div class="swiper-slide" style="background-image:url(${image.image})"></div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div style="display: inline-block;text-align: center;margin: 0 auto;vertical-align: top">
                            <div><h3 style="text-align: center">上传照片</h3></div>
                            <div style="width: 300px;height: 300px;text-align: center;border:1px solid rgba(0,0,0,0.6);position: relative;">
                                <a style="font-size: 20px;" class="uploadImg" id="noUploadImage">未上传图片</a>
                                <img id="uploadImg" class="uploadImg"/>
                            </div>
                            <button class="uploadButton" style="font-size: 16px;">
                                <input type="file" id="chooseImage" name="chooseImage" style="margin-left: 10px;">
                            </button>
                        </div>
                    </div>

                    <div style="margin: 0 auto;width: 120px;padding-bottom: 200px;padding-top: 100px">
                        <button class="confirmButton" style="font-size: 18px;background-size:cover" onclick="fuse($('#chooseImage').val(),$('.swiper-slide-duplicate-active').attr('id'))">开始合成</button>
                    </div>
                    <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />

                    <div style="text-align: center;margin-top: 40px">
                        <div><h3>合成结果</h3></div>
                        <div style="margin: 0 auto;width: 500px;height: 500px;border:1px solid rgba(0,0,0,0.6);position: relative;">
                            <a style="font-size: 40px;" class="uploadImg" id="noFuseImage">尚无合成效果</a>
                            <img id="fuseImage" class="fuseImage" data-tag="fuseImage"/>
                        </div>
                    </div>
                </div>
            <div class="clearfix" style="margin-top:60px;text-align: center;height: 60px"> </div>
        </div>

        <hr style="width:80%;margin:0 auto;border: 0;height: 1px;background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));" />
        <div class="clearfix"></div>
        <div style="margin:0 auto;text-align: center;width:80%;background-color: rgba(192,209,255,0.20);">
            <div class="clearfix"></div>
            <h2  style="margin-top: 80px">给我们支持</h2>
            <p>如果您喜欢该功能，不要忘了为我们点赞，并分享给您的好友哦。</p>
            <p>感谢Face++旷视提供技术支持</p>
            <hr>
            <ul class="social-button" style="margin-bottom: 60px">
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-thumbs-up"></span>
                    </a>
                </li>
            </ul>
            <p>分享该页面给您的好友</p>
            <tr>
                <td>
                    <div class="bdsharebuttonbox" style="width: 230px;margin: 0 auto" >
                        <a href="#" class="bds_more" data-cmd="more"></a>
                        <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                        <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                        <a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>
                        <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到qq"></a>
                        <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                    </div>
                    <br>
                </td>
            </tr>
            <div class="clearfix" style="height: 60px"></div>
        </div>

        <div class="advert" style="height: 300px;width: 100%;text-align: center;background-color: rgba(255,5,0,0.3)">广告位招租</div>
    </div>




    <jsp:include page="footer.jsp"></jsp:include>


    <!-- 图片切换 -->
    <script src="/js/swiper.min.js"></script>
    <script>
        var galleryThumbs = new Swiper('.gallery-thumbs', {
            spaceBetween: 10,
            slidesPerView: 4,
            loop: true,
            freeMode: true,
            loopedSlides: 5, //looped slides should be the same
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        var galleryTop = new Swiper('.gallery-top1', {
            spaceBetween: 10,
            loop:true,
            loopedSlides: 5, //looped slides should be the same
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: galleryThumbs,
            },
        });
    </script>

    <!-- 上传图片预览 -->
    <script>
        $('#chooseImage').on('change',function(){
            var filePath = $(this).val(),
                fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),
                src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
            // 检查是否是图片
            if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
                alert('上传错误,文件格式必须为：png/jpg/jpeg');
                return;
            }
            $('#uploadImg').attr('src',src);
            $('#noUploadImage').remove();
        });
    </script>

    <!-- 上传到后台 -->
    <script>
        function fuse(image,id){
            if(image == ''){
                alert('您还未上传图片');
                return;
            }
            var fileFormat = image.substring(image.lastIndexOf(".")).toLowerCase()
            if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
                alert('上传错误,文件格式必须为：png/jpg/jpeg');
                return;
            } else {
                $('.confirmButton').removeAttr('onclick');
                $('.confirmButton').attr('class','loading');
                $('.loading').html('穿越中')

                alert("正在穿越中，请您稍等一会。");
                var fileObj = $('#chooseImage')[0].files[0];
                var formFile = new FormData();
                formFile.append("action", "UploadVMKImagePath");
                formFile.append("file", fileObj); //加入文件对象
                var data = formFile;
                $.ajax({
                    "async":true,
                    "type":"POST",
                    "url":"${pageContext.request.contextPath}/faceFuse?id=" + id,	//传输路径
                    processData: false,//用于对data参数进行序列化处理 这里必须false
                    contentType: false, //必须
                    "data":data,
                    "success":function(data){
                        $('.loading').html('开始合成');
                        $('.loading').attr('class','confirmButton');
                        $('.confirmButton').attr('onclick','fuse($(\'#chooseImage\').val(),$(\'.swiper-slide-duplicate-active\').attr(\'id\'))');
                        if( "OK" == data.substring(0,2)){
                            alert("图片已生成完毕，请客官查看。");
                            $('#fuseImage').attr('src',data.substring(2));
                            $('#noFuseImage').remove();
                        } else {
                            alert(data);
                        }
                    }
                })
            }
        }
    </script>

    <!-- 百度分享代码-->
    <script>window._bd_share_config=
        {
            'common': {
                    'bdSnsKey':{},
                    'bdText':'尧舜禹---以史为鉴，指导未来，启发智能，感动人心。我在这里生成了一张很有趣的照片哦，快点来试一试吧',
                    'bdUrl':'http://cairuojin.club/entertainmentFuse',
                    'bdSize':'16'
                },
            'share': {
                "bdSize" : 32,
            },
            'image':[{
                "tag" : "fuseImage",
                viewType : 'list',
                viewPos : 'top',
                viewColor : 'black',
                viewSize : '16',
                viewList : ['more','qzone','tsina','tieba','tqq','weixin']
            }]
        };with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
    </script>
</body>
</html>
