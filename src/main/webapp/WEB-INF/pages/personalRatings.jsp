<%--
  Created by IntelliJ IDEA.
  User: lukeyuan
  Date: 2020/4/5
  Time: 4:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Personal Ratings</title>

</head>
<script type="text/javascript" src="../../js/echarts.js" ></script>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<body>
<!--%=request.getAttribute("PersonalRating").toString()%> <br-->
<div id="main" style="width: 600px;height:400px;"></div>
<div align="center">
    <label for="name">Name</label><input id="name" type="text">
    <button onclick="getData()">Search</button>
</div>
<script type="text/javascript">
    var myChart=echarts.init(document.getElementById('main'));

    myChart.setOption({
        title:{
            text:'AvgRating'
        },
        tooltip:{},
        legend:{
            data:['ratings']
        },
        xAxis:{
            data:[]
        },
        yAxis:{},
        series:[{
            name:'Ratings',
            type: 'line',
            data: '[]'
        }]
    });

    var years=[];
    var ratings=[];

    function getData() {
        //myChart.clear();
        var varname=document.getElementById("name");
        var name=varname.value;

        $.ajax({
            type: "post",
            async: true,
            url: "/movies/findPersonalRatingsAjax",
            data: {name: name},
            dataType: "json",
            success: function (result) {
                //alert(result);
                if (result) {
                    //alert(result);
                    console.log(result);
                    for (var i = 0; i < result.length; i++) {
                        years.push(result[i].year);
                        ratings.push(result[i].avgRating);
                    }
                    //var test='['+result[0].year+','+result[0].avgRating+']';
                    //alert(test);
                    //console.log(years);
                    //console.log(ratings);
                    myChart.hideLoading();
                    myChart.setOption({
                        xAxis: {
                            data: years
                        },
                        series: [{
                            name: 'ratings',
                            data: ratings
                        }]
                    });
                }

            },
            error: function (errorMsg) {
                alert("Failed to get data！");
                myChart.hideLoading();
            }
        })
    }
</script>
<!--script>
    /*
    var $year=[];
    var $avgRating=[];
    $(function () {
        var $temp=toString();
        for (var i=0;i<$temp.length;i++){
            $year.push($temp[i].year);
            $avgRating.push($temp[i].avgRating);
        }

    });
    */
    //("运行到这一步");
    var $year=[];
    var $avgRating=[];
    var $raw='<!%=request.getAttribute("PersonalRating")%>';
    alert($raw);
    for (var i=0;i<$raw.length;i++){
        alert($raw[i]);
        $year.push($raw[i].year);
        $avgRating.push($raw[i].avgRating);
    }
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: $year
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: $avgRating
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


</script-->
<!--script>
    function generateChart(data) {
        alert("generating");
        var myChart=echarts.init(document.getElementById('main'));
        myChart.clear();
        myChart.showLoading();
        var option={
            title:{
                text: 'Average Rating of each Year'
            },

            tooltip:{
                trigger:'axis'
            },

            axisLabel:{
                interval:0
            },

            legend:{
                data:['rating']
            },

            xAxis:{
                data: data.year
            },
            yAxis:{
                data: data.ratings
            }
        };
        myChart.setOption(option);
    }
    function getData() {
        //alert("getting");
        var varname=document.getElementById("name");
        var name=varname.value;
        //alert(name);
        //alert("getting data");
       // console.log("getting data");
        $.post(
            "/movies/findPersonalRatingsAjax",
            {name: name},
            function (data) {
                generateChart(data);

            },
            "json"
        );
    }
</script-->
<a href="http://localhost:8080/">
    <button>Back</button>
</a>
</body>
</html>