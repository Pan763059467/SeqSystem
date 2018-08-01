<!-- <!DOCTYPE html>
[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]
[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]
[if IE 8]>         <html class="no-js lt-ie9"> <![endif]
[if gt IE 8]>> <html class="no-js"> <![endif]
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>EasySRS服务介绍</title>
	<meta name="viewport" content="width=device-width*80%, initial-scale=1">
	<meta name="description" content="EasySRS" />
	<meta name="keywords" content="EasySRS" />
	<meta name="author" content="EasySRS" />

	Place favicon.ico and apple-touch-icon.png in the root directory
	<link rel="shortcut icon" href="favicon.ico">
	
	Animate.css
	<link rel="stylesheet" href="css/animate.css">
	Icomoon Icon Fonts
	<link rel="stylesheet" href="css/icomoon.css">
	Simple Line Icons
	<link rel="stylesheet" href="css/simple-line-icons.css">
	Bootstrap
	<link rel="stylesheet" href="css/bootstrap.css">
	Owl Carousel
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	Style
	<link rel="stylesheet" href="css/style.css">


	Modernizr JS
	<script src="js/modernizr-2.6.2.min.js"></script>
	FOR IE9 below
	[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]

	</head> -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

<head>

    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>EasySRS服务介绍</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="EasySRS" />
	<meta name="keywords" content="EasySRS" />
	<meta name="author" content="EasySRS" />

    <link rel="shortcut icon" href="<%=basePath%>/example/favicon.ico">
    <link href="<%=basePath%>/css/animate.css" rel="stylesheet">
    <link href="<%=basePath%>/css/icomoon.css" rel="stylesheet">
    <link href="<%=basePath%>/css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/bootstrap.css" rel="stylesheet">
    <link href="<%=basePath%>/css/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/owl.theme.default.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/style.css" rel="stylesheet">

    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>


	<body>
	<header role="banner" id="fh5co-header">
		<div class="fluid-container">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<!-- Mobile Toggle Menu Button -->
					<!-- <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
					<a class="navbar-brand" href="index.html"><span>U</span>nion</a>  -->
					<div style="padding:2% 0">
						<a href="index.html"><img src="img/logo.png" alt="EasySRS" height="10%" width="39%"></a>
					</div>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="#" data-nav-section="home"><span>首页</span></a></li>
						<li><a href="#" data-nav-section="explore"><span>产品展示</span></a></li>
						<li><a href="#" data-nav-section="role"><span>项目角色</span></a></li>
						<li><a href="#" data-nav-section="services"><span>提供服务</span></a></li>
						<li><a href="#" data-nav-section="team"><span>开发团队</span></a></li>
						<li><a href="#" data-nav-section="faq"><span>F.A.Q.</span></a></li>
						<li class="call-to-action"><a href="login.html"><span>点击使用</span></a></li>
					</ul>
				</div>
			</nav>
	  </div>
	</header>

	<section id="fh5co-home" data-section="home" style="background-image: url(img/z_p1bg.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">“快易”需求文档编辑系统</h1>
							<h2 class="to-animate">一款致力于简化和规范需求文档编写的产品<br></a></h2>
							<h2 class="to-animate"><a href="easysrs.cn" target="_blank">EasySRS</a></h2>
							<div class="call-to-action">
								<a href="login.html" class="download to-animate"><big>注册 / 登录</big></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-explore" data-section="explore">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">产品展示</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>定义软件总体要求，作为用户和软件开发人员之间的理解和交流基础<br>
								提供性能要求，初步设计对用户的影响信息，作为开发人员进行软件结构设计和编码的基础<br>
								作为确认测试和验收的依据
							</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="fh5co-explore">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-push-5 to-animate-2">
						<img class="img-responsive" src="img/showpage2.png" alt="work">
					</div>
					<div class="col-md-4 col-md-pull-8 to-animate-2">
						<div class="mt">
							<h3>简易操作</h3>
							<p>“快易”需求文档编辑系统，实现需求规范化，快速化，模板化和易操作化的需求文档编辑系统</p>
							<ul class="list-nav">
								<li><i class="icon-check2"></i>一键创建项目</li>
								<li><i class="icon-check2"></i>管理项目</li>
								<li><i class="icon-check2"></i>添加文档</li>
								<li><i class="icon-check2"></i>所属机构</li>
								<li><i class="icon-check2"></i>统一管理</li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div>

		<div class="fh5co-explore fh5co-explore-bg-color">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-pull-1 to-animate-3">
						<img class="img-responsive" src="img/showpage1.png" alt="work">
					</div>
					<div class="col-md-4 to-animate-3">
						<div class="mt">
							<div>
								<h4><i class="icon-people"></i>项目管理</h4>
								<p>一键申请加入团队，邀请添加组员，分配小组任务，便于统一管理。 </p>
							</div>
							<div>
								<h4><i class="icon-video2"></i>构件库</h4>
								<p>了解构建系统，用于知识学习和收藏，收藏后的构件库可直接用于文档编写。 </p>
							</div>
							<div>
								<h4><i class="icon-shield"></i>消息中心</h4>
								<p>项目成员实时获取申请或邀请信息，不遗漏小组项目消息。 </p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="fh5co-testimony" data-section="role">
		<div class="container">
			<div class="row">
				<div class="col-md-12 to-animate">
					<div class="wrap-testimony">
						<div class="owl-carousel-fullwidth">
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="img/div1_3.png" alt="user">
									</figure>
									<blockquote>
										<p>系统管理员负责对系统的维护，有很高的权限，主要包括对用户和权限的管理，主要是对系统后台进行管理和任命或免除机构管理员。</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="img/u12.png" alt="user">
									</figure>
									<blockquote>
										<p>机构管理人员涉及的功能比较多，可以查看机构的当前项目和历史项目的名称和数量，以及查看、删除机构的注册人员邀请用户进入机构。</p>
									</blockquote>
								</div>
							</div>
							<div class="item">
								<div class="testimony-slide active text-center">
									<figure>
										<img src="img/magnifier_2.png" alt="user">
									</figure>
									<blockquote>
										<p>系统前台的主要使用者，准用户第一次登录网站可进行注册。登录网站后可进行需求文档编辑，根据其在小组中的不同身份，分为组长和组员，分别进行项目的管理和文档编写。</p>
									</blockquote>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="getting-started getting-started-1">
		<div class="container">
			<div class="row">
				<div class="col-md-6 to-animate">
					<h3>开始使用</h3>
					<p>进入网站，并决定使用网站提供的服务。成功注册成为用户，可享受提供的后续各种服务。</p>
				</div>
				<div class="col-md-6 to-animate-2">
					<div class="call-to-action text-right">
						<a href="login.html" class="sign-up">免费注册</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section id="fh5co-services" data-section="services">
		<div class="fh5co-services">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">提供服务</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext">
								<h3 class="to-animate">我们，不止于此 </h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="box-services">
							<i class="icon-chemistry to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>注册机构</h3>
								<p>注册机构<br>
								   邀请成员<br>
								   统计机构
								   </p>
							</div>
						</div>

						<div class="box-services">
							<i class="icon-energy to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>文档编辑</h3>
								<p>编辑<br>
								   用例提取<br>
								   用例变更
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box-services">
							<i class="icon-trophy to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>创建文档目录</h3>
								<p>创建文档目录</p>
							</div>
						</div>

						<div class="box-services">
							<i class="icon-paper-plane to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>项目创建和管理</h3>
								<p>机构下创建私人 / 公众项目<br>
								   邀请成员 / 任命职务<br>
								   结束 / 删除项目<br>
								   修改项目信息<br>
								   统计<br>
								   用例进度跟进
								</p>

							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="box-services">
							<i class="icon-people to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>项目创建构件</h3>
								<p>创建构件</p>
							</div>
						</div>

						<div class="box-services">
							<i class="icon-screen-desktop to-animate-2"></i>
							<div class="fh5co-post to-animate">
								<h3>文档管理</h3>
								<p>编辑文档<br>
								   保存文档<br>
								   删除文档<br>
								   输出文档
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="call-to-action text-center to-animate"><a href="#" class="btn btn-learn"><big>了解更多>></big></a></div>
			</div>
		</div>
	</section>	
    
    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>

	<section id="fh5co-team" data-section="team">
		<div class="fh5co-team">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">开发团队</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext">
								<h3 class="to-animate">一个有爱的大家庭 </h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="team-box text-center to-animate-2">
							<div class="user"><img class="img-reponsive" src="img/panguoguo.jpg" alt="Roger Garfield"></div>
							<h3>潘勇</h3>
							<span class="position">Full Stack Developer</span>
							<p>潘锅锅  潘锅锅  潘锅锅<br>
							   潘锅 锅潘锅 锅潘锅 锅<br>
							   潘 锅锅潘 锅锅潘   锅锅<br>
							   潘锅锅  潘锅锅    潘锅锅<br>
							   潘锅 锅潘锅 锅潘锅 锅<br>
							   潘 锅锅潘   锅锅潘   锅锅<br>
							   潘锅锅  潘锅锅   潘锅锅<br>
							   潘锅  锅潘锅 锅潘锅  锅
							</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="team-box text-center to-animate-2">
							<div class="user"><img class="img-reponsive" src="img/teamleader.jpg" alt="Roger Garfield"></div>
							<h3>欧阳柳波</h3>
							<span class="position">teamleader</span>
							<p>博士，副教授，硕士生导师。<br>
							   主要研究领域为大数据处理、软件工程和知识工程等。<br>
							   主持和参加过20多项研究课题，包括“十五”国家科技基础性研究专项课题、国家核高基重大专项课题等等。<br>
							   发表学术论文30多篇，登记软件著作权6项，培养硕士研究生60多人。
							</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="team-box text-center to-animate-2">
							<div class="user"><img class="img-reponsive" src="img/GodV.jpg" alt="Roger Garfield"></div>
							<h3>丘家玮</h3>
							<span class="position">Full Stack Developer</span>
							<p>丘家玮，广东惠州人，学识渊博、拥有20年互联网工作经验，代码不拘一格，能把C++、JAVA、python、PHP敲进一个代码。常年站在互联网技术的最高峰，他对整个互联网技术的发展有着独到的见解，本产品有着他十多年来的见解，为了产品早日出成果，每天敲10万+行代码，改2000+个bug，可谓是业界模范。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-faq" data-section="faq">
		<div class="fh5co-faq">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">常见问题</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext">
								<h3 class="to-animate">开始之前，你需要知道以下几点</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<div class="box-faq to-animate-2">
							<h3>什么是EasySRS？</h3>
							<p>一款致力于简化和规范软件需求规格说明书编写的产品，并将其纳入软件项目管理范畴，使文档编写更加高效便捷。</p>
						</div>
						<div class="box-faq to-animate-2">
							<h3>如果遇到技术上的问题，应该如何联系产品开发团队？ </h3>
							<p>页面底部有我们的联系方式和通信地址，欢迎客户提出建议和意见。</p>
						</div>
						<div class="box-faq to-animate-2">
							<h3>如何使用这款产品？</h3>
							<p>点击页面右上角“开始使用”，开始项目需求文档的规范化编写和管理之旅吧！</p>
						</div>
					</div>

					<div class="col-md-6">
						<div class="box-faq to-animate-2">
							<h3>产品支持的语言？</h3>
							<p>目前支持中文和英文哦，后续语言有待开发。</p>
						</div>
						<div class="box-faq to-animate-2">
							<h3>可以使用已存在的用户名吗？</h3>
							<p>若该用户名为此用户先前申请的，可通过找回密码重新的登录；若被其他用户占用，建议另外申请一个账号。</p>
						</div>
						<div class="box-faq to-animate-2">
							<h3>“快易”需求文档编辑系统是免费的吗？</h3>
							<p>作为项目成员可免费使用本产品，包括免费编写文档和引用构建，作为项目创始人创建项目时需要一定的积分，积分可通过上传构建获得。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<hr>

	<div id="fh5co-footer" role="contentinfo">
		<div class="container">
			<div class="row">
				<div class="col-md-6 to-animate">
					<h3 class="section-title">关于我们</h3>
					<p>一支来自湖南大学的师生团队，由欧阳柳波老师带领，<br>研究便于软件需求开发过程的可用易用软件。
						
					</p>
					<p class="copy-right">&copy; 2018 HNU EasySRS <br>All Rights Reserved. <br></p>
				</div>

				<div class="col-md-6 to-animate">
					<h3 class="section-title">地址</h3>
					<ul class="contact-info">
						<li><i class="icon-map-marker"></i>湖南省 长沙市 岳麓区 湖南大学 410000</li>
						<li><i class="icon-phone"></i>0731 0000 0000</li>
						<li><i class="icon-envelope"></i>EasySRS@hnu.edu.cn</a></li>
						<li><i class="icon-globe2"></i><a href="easysrs.cn">easysrs.cn</a></li>
					</ul>
					<h3 class="section-title">联系我们</h3>
					<ul class="social-media">
						<li><a href="https://github.com/Pan763059476" class="github"><i class="icon-github-alt"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=basePath%>/js/jquery.min.js"></script>
	<script src="<%=basePath%>/js/query.easing.1.3.js"></script>
	<script src="<%=basePath%>/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/js/jquery.waypoints.min.js.js"></script>
	<script src="<%=basePath%>/js/jquery.stellar.min.js"></script>
	<script src="<%=basePath%>/js/owl.carousel.min.js"></script>
	<script src="<%=basePath%>/js/main.js"></script>


	<!-- jQuery
	<script src="js/jquery.min.js"></script>
	jQuery Easing
	<script src="js/jquery.easing.1.3.js"></script>
	Bootstrap
	<script src="js/bootstrap.min.js"></script>
	Waypoints
	<script src="js/jquery.waypoints.min.js"></script>
	Stellar Parallax
	<script src="js/jquery.stellar.min.js"></script>
	Owl Carousel
	<script src="js/owl.carousel.min.js"></script>
	Google Map
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="js/google_map.js"></script>
	Main JS (Do not remove)
	<script src="js/main.js"></script> -->

	</body>
</html>

