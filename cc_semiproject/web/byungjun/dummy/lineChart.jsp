<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트연습</title>
<!-- stylesheet -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" /> -->
<link rel="stylesheet" href="c3.min.css">
<!-- javascript -->
<script src="https://d3js.org/d3.v3.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script> -->
<script type="text/javascript" src="c3.min.js"></script>
<script type="text/javascript">
var areachart = c3.generate({
	bindto : "#areachart",
	data : {
		columns : [ [ 'data1', 300, 350, 300, 190, 50, 25 ],
				[ 'data2', 130, 100, 140, 200, 150, 50 ] ],
		types : {
			data1 : 'area-spline',
			data2 : 'area-spline'
		}
	}
});
	/* var chart = c3.generate({
	    data: {
	        columns: [
	            ['data1', 30, 200, 100, 400, 150, 250],
	            ['data2', 50, 20, 10, 40, 15, 25]
	        ]
	    }
	});

	setTimeout(function () {
	    chart.load({
	        columns: [
	            ['data1', 230, 190, 300, 500, 300, 400]
	        ]
	    });
	}, 1000);
	setTimeout(function () {
	    chart.load({
	        columns: [
	            ['data3', 130, 150, 200, 300, 200, 100]
	        ]
	    });
	}, 1500);

	setTimeout(function () {
	    chart.unload({
	        ids: 'data1'
	    });
	}, 2000); */
</script>
</head>
<body>
	<div id="areachart"></div>
	<div>ㅇㅇ</div>
</body>
</html>