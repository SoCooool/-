<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>

<html>

<head>
    <title><?php echo ($title); ?> <?php echo ($key4); ?></title>
  <meta charset="utf-8" />


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Keywords" content="<?php echo ($title); ?> <?php echo ($key2); ?>" />
<meta name="Description" content="<?php echo ($title); ?> <?php echo ($key3); ?> <?php echo ($desc); ?>" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="">

    <meta name="author" content="">
	

    <!-- Bootstrap Core CSS -->

    <link rel="stylesheet" href="/Public/css/bootstrap.min.css"  type="text/css">

	

	<!-- Custom CSS -->

    <link rel="stylesheet" href="/Public/css/style.css">

	

	<!-- Owl Carousel Assets -->

    <link href="/Public/owl-carousel/owl.carousel.css" rel="stylesheet">

    <link href="/Public/owl-carousel/owl.theme.css" rel="stylesheet">

	

	<!-- Custom Fonts -->

    <link rel="stylesheet" href="/Public/font-awesome-4.4.0/css/font-awesome.min.css"  type="text/css">

	

	<!-- jQuery -->

	<script src="/Public/js/jquery-2.1.1.js"></script>

	

	<!-- Core JavaScript Files -->  	 

    <script src="/Public/js/bootstrap.min.js"></script>

	

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>

        <script src="js/html5shiv.js"></script>

        <script src="js/respond.min.js"></script>

    <![endif]-->

</head><body>

<header>

	<!--Top-->

	<nav id="top">

		<div class="container">

			<div class="row">

				<div class="col-md-6 col-sm-6">

					<strong>欢迎访问 随风视频站</strong> 采集优酷视频 免维护</div>

  <div class="col-md-6 col-sm-6">

					<ul class="list-inline top-link link"><li></li>

					</ul>

			  </div>

			</div>

		</div>

	</nav>

    

	<!--Navigation-->

    <nav id="menu" class="navbar">

		<div class="container">

			<div class="navbar-header"><span id="heading" class="visible-xs">随风视频</span>

			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>

			</div>

			<div class="collapse navbar-collapse navbar-ex1-collapse">

				<ul class="nav navbar-nav">

					<li><a href="/"><i class="fa fa-home"></i> 首页</a></li>


<?php if(is_array($ff)): $i = 0; $__LIST__ = $ff;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li><a  href="/index.php/home/index?url=q_<?php echo ($vo); ?>_orderby_1_limitdate_0"><i class="fa fa-play-circle-o"></i> <?php echo ($vo); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
	

              
             

				</ul>

			</div>

		</div>

	</nav>

	<div style="margin:0 auto;width:1170px;">
   <?php echo ($ad); ?></div>

	

</header>

<!-- Header -->

	

	<!-- /////////////////////////////////////////Content -->

    

	<div id="page-content" class="archive-page">

		<div class="container">

        

			<div class="row">

				<div id="main-content" class="col-md-12">

                

            	<div class="box">

						<div class="box-header">

							<h2><i class="fa fa-vimeo-square"></i> <?php echo ($ti); ?></h2>

						</div>

						<div class="box-content">

							<div class="row">

								

                                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="col-md-3">

									<div class="wrap-vid">

										<div class="zoom-container">

											<div class="zoom-caption">

												<span>SF024</span>

												<a href="<?php echo ($list2[$key]); ?>">

													<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>

												</a>

												<p><?php echo ($vo); ?></p>

											</div>

											<img src="<?php echo ($list3[$key]); ?>"   />

										</div>

									

										<div class="info">

										

											<span><i class="fa fa-heart"></i><?php echo ($list4[$key]); ?></span>

										</div>

									</div>

								</div><?php endforeach; endif; else: echo "" ;endif; ?>

                                

								

								</div>

							</div>

						</div>

					</div>

				</div>

			

					<center>

				<?php echo ($page); ?>

					</center>

				</div>

			</div></div></div>

<br />
<br />
<footer>
		<div class="top-footer" >
			<ul class="footer-social list-inline">
				<li style="color:#CCCCCC;"><B>© 2016 随风视频站 - 优酷采集 保留所有权利 技术支持： 互信网络 </B></li>
	
			</ul>  
		</div>
		
	</footer>
	<!-- Footer -->
	

</body>
</html>