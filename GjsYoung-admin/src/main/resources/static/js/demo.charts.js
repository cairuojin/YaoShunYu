$(function () {
    var sin = [], cos = [];
    for (var i = 0; i < 10; i += 0.2) { //图表数据
        sin.push([i, i*30]);
        cos.push([i, i*5]);
    }

    var plot = $.plot($("#mws-line-chart"),
        [
            { data: sin, label: "i", color: "#c75d7b"},
            { data: cos, label: "i*5", color: "#c5d52b" }
        ],
        {
            series: {
                lines: { show: true },
                points: { show: true }
            },
            grid: { hoverable: true, clickable: true }
        });
    
    var data = [        //图表的数据
                {label: "American", data: 41211},
                {label: "Indonesian", data: 1312},
                {label: "Dutch", data: 55465},
                {label: "Japanese", data: 1542},
                {label: "Korean", data: 14351},
                {label: "French", data: 6536},
                {label: "Chinese", data: 1531}
                ];             
    
    $.plot($("#mws-pie-1"), 
    	    data, {
    		        series: {
    		            pie: { 
    		                show: true
    		            }
    		        }
    		});
    
    $.plot($("#mws-pie-2"), 
    	    data, {
    		        series: {
    		            pie: { 
    		                show: true
    		            }
    		        }, 
    		        legend: {
    		        	show:false
    		        }
    		});
    
    var d1 = [];
    for (var i = 0; i <= 10; i += 1)        //中间的数据
        d1.push([i, parseInt(Math.random() * 30)]);

    var d2 = [];
    for (var i = 0; i <= 10; i += 1)
        d2.push([i, parseInt(Math.random() * 30)]);

    var d3 = [];
    for (var i = 0; i <= 10; i += 1)
        d3.push([i, parseInt(Math.random() * 30)]);

    var stack = 0, bars = true, lines = false, steps = false;
    
    $.plot($("#mws-bar-chart"), [ d1, d2, d3 ], {
        series: {
            stack: stack,
            lines: { show: lines, fill: true, steps: steps },
            bars: { show: bars, barWidth: 0.6 }
        }
    });
});