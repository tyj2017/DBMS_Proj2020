<%--
  Created by IntelliJ IDEA.
  User: lukeyuan
  Date: 2020/4/11
  Time: 5:24 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gender Ratio</title>
    <!-- meta data -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!--font-family-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- title of site -->
    <title>Directory Landing Page</title>

    <!-- For favicon png -->
    <link rel="shortcut icon" type="image/icon" href="assets/logo/favicon.png"/>

    <!--font-awesome.min.css-->
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">

    <!--linear icon css-->
    <link rel="stylesheet" href="../../assets/css/linearicons.css">

    <!--animate.css-->
    <link rel="stylesheet" href="../../assets/css/animate.css">

    <!--flaticon.css-->
    <link rel="stylesheet" href="../../assets/css/flaticon.css">

    <!--slick.css-->
    <link rel="stylesheet" href="../../assets/css/slick.css">
    <link rel="stylesheet" href="../../assets/css/slick-theme.css">

    <!--bootstrap.min.css-->
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">

    <!-- bootsnav -->
    <link rel="stylesheet" href="../../assets/css/bootsnav.css" >

    <!--style.css-->
    <link rel="stylesheet" href="../../assets/css/style.css">

    <!--responsive.css-->
    <link rel="stylesheet" href="../../assets/css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <script type="text/javascript" src="../../js/echarts (2).js" ></script>
    <script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
    <![endif]-->
</head>
<script type="text/javascript" src="../../js/echarts.js" ></script>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<body>
<section class="top-area">
    <div class="header-area">
        <!-- Start Navigation -->
        <nav class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"  data-minus-value-desktop="70" data-minus-value-mobile="55" data-speed="1000">

            <div class="container">

                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="localhost:8080">DB<span>MS</span></a>

                </div><!--/.navbar-header-->
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                    <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class=" scroll active"><a href="#home">home</a></li>
                        <li class="scroll"><a href="#works">how it works</a></li>
                        <!--li class="scroll"><a href="#explore">explore</a></li>
                        <li class="scroll"><a href="#reviews">review</a></li>
                        <li class="scroll"><a href="#blog">blog</a></li-->
                        <li class="scroll"><a href="#contact">contact</a></li>
                    </ul><!--/.nav -->
                </div><!-- /.navbar-collapse -->
            </div><!--/.container-->
        </nav><!--/nav-->
        <!-- End Navigation -->
    </div><!--/.header-area-->
    <div class="clearfix"></div>

</section>

<section id="home" class="welcome-hero">
<div class="container" style="width: 100%">
    <div id="main" style="width: 50%;height:600px; margin: auto; background: rgba(0,0,0,0.3); background: snow; float: left"></div>
    <div id="main2" style="width: 50%;height:600px; margin: auto; background: rgba(0,0,0,0.3); background: snow; float: left"></div>
    <div align="center">
        <button class="welcome-hero-btn" onclick="getData()">Search</button>
    </div>
    <br>
    <a href="http://localhost:8080/">
        <button class="welcome-hero-btn">Back</button>
    </a>
</div>
</section>


<footer id="footer"  class="footer">
    <div class="container">
        <div class="footer-menu">
            <div class="row">
                <div class="col-sm-3">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="localhost:8080 ">DB<span>MS</span></a>
                    </div><!--/.navbar-header-->
                </div>
                <div class="col-sm-9">
                    <ul class="footer-menu-item">
                        <li class="scroll"><a href="#contact">contact</a></li>
                    </ul><!--/.nav -->
                </div>
            </div>
        </div>
        <div class="hm-footer-copyright">
            <div class="row">
                <div class="col-sm-5">
                    <p>
                        &copy;copyright. designed by themesine. Developed by group 03.
                    </p><!--/p-->
                </div>
                <div class="col-sm-7">
                    <div class="footer-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                        <a href="#"><i class="fa fa-google-plus"></i></a>
                    </div>
                </div>
            </div>

        </div><!--/.hm-footer-copyright-->
    </div><!--/.container-->


</footer>

<script type="text/javascript">
    var myChart=echarts.init(document.getElementById('main'));
    var myChart2=echarts.init(document.getElementById('main2'));
    //var Chartdata=[];

        var year=[];
        var ratio=[];
        var type=[];
        var percentage=[];
    var dataShadow = [];

    function getData() {
        $.ajax(
            {
                type: "post",
                async: true,
                url: "/movies/findGenderRatioAjax",
                data: {},
                dataType: "json",
                success: function (result) {
                    year=[];
                    ratio=[];
                    console.log(result);
                    for (var i = 0; i < result.length; i++) {
                        year.push(result[i].year);
                        ratio.push(result[i].GenderRatio);
                    }

                    console.log(year);
                    console.log(ratio);

                    option = {
                        tooltip: {
                            trigger: 'axis',
                            position: function (pt) {
                                return [pt[0], '10%'];
                            }
                        },
                        title: {
                            left: 'center',
                            text: 'Gender Ratio',
                        },
                        toolbox: {
                            feature: {
                                dataZoom: {
                                    yAxisIndex: 'none'
                                },
                                restore: {},
                                saveAsImage: {}
                            }
                        },
                        xAxis: {
                            type: 'category',
                            boundaryGap: false,
                            data: year
                        },
                        yAxis: {
                            type: 'value',
                            boundaryGap: [0, '100%']
                        },
                        dataZoom: [{
                            type: 'inside',
                            start: 0,
                            end: 10
                        }, {
                            start: 0,
                            end: 10,
                            handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                            handleSize: '80%',
                            handleStyle: {
                                color: '#fff',
                                shadowBlur: 3,
                                shadowColor: 'rgba(0, 0, 0, 0.6)',
                                shadowOffsetX: 2,
                                shadowOffsetY: 2
                            }
                        }],
                        series: [
                            {
                                name: 'Female/Male',
                                type: 'line',
                                smooth: true,
                                symbol: 'none',
                                sampling: 'average',
                                itemStyle: {
                                    color: 'rgb(255, 70, 131)'
                                },
                                areaStyle: {
                                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                        offset: 0,
                                        color: 'rgb(255, 158, 68)'
                                    }, {
                                        offset: 1,
                                        color: 'rgb(255, 70, 131)'
                                    }])
                                },
                                data: ratio
                            }
                        ]
                    };
                    myChart.setOption(option);

                },
                error: function (errorMsg) {
                    alert("Failed to get data1");
                }

            });
        $.ajax(
            {
                type: "post",
                async: true,
                url: "/movies/findFemalePercentageAjax",
                data:{},
                dataType: "json",
                success: function (result) {
                    type=[];
                    percentage=[];
                    console.log(result);
                    for (var i = 0; i < result.length; i++) {
                        type.push(result[i].genre);
                        percentage.push(result[i].FemalePercentage);
                    }


                    for (var j = 0; j < type.length; j++) {
                        dataShadow.push(20);
                    }

                    option2={
                        title: {
                            text: 'Female leading movies',
                            subtext: 'Feature Sample: Gradient Color, Shadow, Click Zoom'
                        },
                        xAxis: {
                            data: type,
                            axisLabel: {
                                inside: true,
                                textStyle: {
                                    color: '#000'
                                }
                            },
                            axisTick: {
                                show: false
                            },
                            axisLine: {
                                show: false
                            },
                            z: 10
                        },
                        yAxis: {
                            axisLine: {
                                show: false
                            },
                            axisTick: {
                                show: false
                            },
                            axisLabel: {
                                textStyle: {
                                    color: '#999'
                                }
                            }
                        },
                        dataZoom: [
                            {
                                type: 'inside'
                            }
                        ],
                        series: [
                            { // For shadow
                                type: 'bar',
                                itemStyle: {
                                    color: 'rgba(0,0,0,0.05)'
                                },
                                barGap: '-100%',
                                barCategoryGap: '40%',
                                data: dataShadow,
                                animation: false
                            },
                            {
                                type: 'bar',
                                itemStyle: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#83bff6'},
                                            {offset: 0.5, color: '#188df0'},
                                            {offset: 1, color: '#188df0'}
                                        ]
                                    )
                                },
                                emphasis: {
                                    itemStyle: {
                                        color: new echarts.graphic.LinearGradient(
                                            0, 0, 0, 1,
                                            [
                                                {offset: 0, color: '#2378f7'},
                                                {offset: 0.7, color: '#2378f7'},
                                                {offset: 1, color: '#83bff6'}
                                            ]
                                        )
                                    }
                                },
                                data: percentage
                            }
                        ]
                    };
                    var zoomSize = 6;
                    myChart.on('click', function (params) {
                        console.log(type[Math.max(params.dataIndex - zoomSize / 2, 0)]);
                        myChart.dispatchAction({
                            type: 'dataZoom',
                            startValue: type[Math.max(params.dataIndex - zoomSize / 2, 0)],
                            endValue: type[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
                        });
                    });
                    myChart2.setOption(option2);
                },
                error: function (errorMsg) {
                    alert("Failed to get data");
                }
            }
        )
    }






</script>

</body>
</html>
