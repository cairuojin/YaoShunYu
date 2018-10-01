<%--
  Created by IntelliJ IDEA.
  User: lanzhiyuchn
  Date: 2018/09/22
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>富文本编辑</title>
</head>
<body>
    <div id="centent">
    </div>
    <button id="btn">获取html</button>

    <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/wangEditor-3.1.1/release/wangEditor.min.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor;
        var editor = new E('#centent');
        // 配置服务器端地址
        editor.customConfig.uploadFileName = 'myFileName';
        editor.customConfig.uploadImgServer = '${pageContext.request.contextPath }/uploadImage';
        editor.customConfig.debug = location.href.indexOf('wangeditor_debug_mode=1') > 0;


        editor.customConfig.uploadImgHooks = {
            customInsert: function (insertImg, result, editor) {
                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                var url =result.data;
                insertImg(url);
                // result 必须是一个 JSON 格式字符串！！！否则报错
            }
        }


        editor.create();

        document.getElementById('btn').addEventListener('click', function () {
            console.log(editor.txt.html())
            $.ajax({
                type:"post",
                url:"",
                data:"",
                success:function (data) {
                    
                }
            });
        }, false)
</script>
</body>
</html>
