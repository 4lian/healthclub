<!DOCTYPE html>
<html lang="en">
<head>
<#include "/lib/header.ftl">
    <title>Splash</title>
    <meta charset="UTF-8"/>
    <link href="/css/client/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/client/slider.css" rel="stylesheet" type="text/css"/>
    <script src="/js/index/jquery-1.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/index/loopedslider.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        $(function () {
            $('#slider').loopedSlider({
                autoStart: 2000,
                restart: 4000
            });

        });

    </script>
    <style type="text/css">
        <!--

        body {
            background: url(/images/client/bg.jpg) repeat;
        }

        -->
    </style>

</head>
<!--[if IE]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE7.js"></script>

<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--[if IE 6]>
<script src="/js/index/belatedPNG.js"></script>
<script>
    DD_belatedPNG.fix('*');
</script>
<![endif]-->
<body>
<div id="container">
    <div id="main">
        <header>
            <div class="logo"><a href="#"><img src="/images/client/logo.png" alt="Logo here"/></a></div>
            <div class="start">
                <a href="/index/profile"><img src="/images/client/application.png" alt="Appication" width="50"
                                 height="50"/></a>

                <p>用户资料</p>
            </div>
            <div class="start"><a href="/action/index"><img src="/images/client/weather.png" alt="Time" width="50" height="50"/></a>

                <p>活动</p>
            </div>
            <div class="social">
                <a href="/index/login"><img src="/images/client/login.png" alt="点击登录"/></a>
                <a href="/index/logout"><img src="/images/client/logout.png" alt="登出"/></a>
            </div>
            <div class="divider"></div>
            <nav>
                <h1 class="cursivebig"> &#9988; Splosh集团：室内运动开创者和领导者！</h1>

                <div class="divider"></div>
            </nav>
        </header>

        <div id="slider">
            <div class="container">
                <ul class="slides">
                    <li>
                        <div class="thumbholder"><img src="/images/client/f1.jpg" width="350" height="220"
                                                      alt="I Mac Immagine Disegno"/></div>
                        <div class="txtholder">
                            <h3 class="cursive">
                                体育锻炼有利于人体骨骼、肌肉的生长，增强心肺功能，改善血液循环系统、呼吸系统和消化系统的机能状况，有利于人体的生长发育，提高抗病能力，增强有机体的适应能力。</h3>
                        </div>
                    </li>
                    <li>
                        <div class="thumbholder"><img src="/images/client/f2.jpg" width="350" height="220"
                                                      alt="First Image"/></div>
                        <div class="txtholder">
                            <h3 class="cursive">
                                攀岩是从登山衍生出的一项运动。在约1970年前攀岩一直附属登山系统之下，目的只是为了克服登山过程中的困难。直到70年之后，在法国，攀岩真正变成一项独立运动。</h3>
                        </div>
                    </li>
                    <li>
                        <div class="thumbholder"><img src="/images/client/f3.jpg" width="350" height="220"
                                                      alt="First Image"/></div>
                        <div class="txtholder">
                            <h3 class="cursive">&#8220;
                                在野外搭了营帐住宿，过去是军事或体育训练的一种项目，现在成为了普通群众的休闲活动。野营一般需要生篝火，它既可以防止野兽的侵袭，也可以用作烧、烤、煮或加热野营食物，因此生火对于野营来说是很重要的。 </h3>
                        </div>
                    </li>
                    <li>
                        <div class="thumbholder"><img src="/images/client/f4.jpg" width="350" height="220"
                                                      alt="First Image"/></div>
                        <div class="txtholder">
                            <h3 class="cursive">
                                滑雪是运动员把滑雪板装在靴底上在雪地上进行速度、跳跃和滑降的竞赛运动。滑雪板用木材、金属材料和塑料混合制成。高山滑雪由滑降，小回转和大回转（障碍滑雪）组成。高山滑雪混合项目，由上述三个项目组成。人们成站立姿态，手持滑雪杖、足踏滑雪板在雪面上滑行的运动。“立”、“板”、“雪”、“滑”是滑雪运动的关键要素。 </h3>
                        </div>
                    </li>
                </ul>
                <ul class="pagination">
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                </ul>
            </div>
        </div>
        <footer>
            <div class="home"><a href="#"><img src="/images/client/agt_home.png" alt="Home Page" width="64"
                                               height="64"/></a>

                <p class="cursive">Home Page</p>
            </div>
            <div class="about"><a href="/index/about"><img src="/images/client/info.png" alt="About Us" width="62"
                                                           height="63"/></a>

                <p class="cursive">About Us</p>
            </div>
            <div class="portfolio"><a href="/index/profile"><img src="/images/client/graphic_design.png" alt="Portfolio"
                                                                 width="64"
                                                                 height="64"/></a>

                <p class="cursive">Profile</p>
            </div>
            <div class="contact">
                <a href="/index/contact"><img src="/images/client/email_send.png" alt="Contact  us" width="67"
                                 height="61"/></a>

                <p class="cursive">Contact Us</p>
            </div>
        </footer>
    </div>
</div>
</div>
<!-- Free template distributed by http://freehtml5templates.com -->
</body>
</html>
