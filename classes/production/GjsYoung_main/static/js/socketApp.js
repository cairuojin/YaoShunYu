var stompClient = null;

//添加消息
function showGreeting(message) {
    $("#message").val("");
    var comments = $("#greetings").find("tr");
    if(comments.length<6){
        $("#greetings").append("<tr><td>" + message + "<br/></td></tr>");
    }else {
        for (var i=0;i<comments.length-1;++i){
            var temp = $(comments[i+1]).html();
            $(comments[i]).html(temp);
        }
        $(comments[comments.length-1]).html("<td >" + message + "<br/></td>");
    }
}
//加载函数
$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    var socket = new SockJS('http://111.230.196.33:80/gs-guide-websocket'); //todo 修改到Linux地址
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        stompClient.subscribe('/topic/greetings', function (message) { //订阅 广播模式
            showGreeting(JSON.parse(message.body).message);
        });
    });
    $( "#send" ).click(function() { sendMessage(); });
});

//发送消息到hello
function sendMessage() {
    if($.trim($("#message").val()).length > 20){
        alert("内容不能超过20字");
        return;
    }
    if($.trim($("#message").val()).length == 0){
        alert("内容不能为空");
        return;
    }
    stompClient.send("/hello", {}, JSON.stringify({'message': $("#message").val()}));
}