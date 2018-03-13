<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<title>C&C 렌터카</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Script-Type" content="text/javascript">
	<meta http-equiv="Content-Style-Type" content="text/css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="/cs/css/common.css" rel="stylesheet" type="text/css">
	<link href="/cs/css/sub.css" rel="stylesheet" type="text/css">
	<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
	/* Remove the navbar's default margin-bottom and rounded borders */
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
	}
	
	/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
	.row.content {
		height: 450px
	}
	
	/* Set gray background color and 100% height */
	.sidenav {
		padding-top: 20px;
		background-color: #f1f1f1;
		height: 100%;
	}
	
	/* Set black background color, white text and some padding */
	footer {
		background-color: #555;
		color: white;
		padding: 15px;
		margin-top: 120px;
	}
	
	#menu {
		height: 30px;
	}
	
	#utilMenu>ul {
		text-align: right;
		margin-left: 900px;
	}
	
	#utilMenu>ul li {
		list-style: none;
		float: left;
	}
	
	#utilMenu>ul li a {
		text-decoration: none;
		margin-right: 10px;
		font-size: 8pt;
	}
	
	.carousel-inner img {
		-webkit-filter: grayscale(90%);
		filter: grayscale(90%); /* make all photos black and white */
		width: 100%; /* Set width to 100% */
		margin: auto;
	}
	
	.carousel-caption h3 {
		color: #fff !important;
	}
	
	#imageslide {
		width: 100%;
		margin-top: 20px;
	}
	
	@media ( max-width : 600px) {
		.carousel-caption {
			display: none;
			/* Hide the carousel text when the screen is less than 600 pixels wide */
		}
	}
	
	/* On small screens, set height to 'auto' for sidenav and grid */
	@media screen and (max-width: 767px) {
		.sidenav {
			height: auto;
			padding: 15px;
		}
		.row.content {
			height: auto;
		}
	}
	
	</style>