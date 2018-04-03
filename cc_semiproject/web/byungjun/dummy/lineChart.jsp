<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트연습</title>
<!-- stylesheet -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
<!-- <link rel="stylesheet" href="c3.min.css"> -->
<!-- javascript -->
<!-- <script src="https://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="c3.min.js"></script> -->

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script> -->
</head>
<body>
	<script src="https://d3js.org/d3.v3.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
	<div id="areachart" style="width:700px; height:300px;"></div>
	<script>
		var areachart = c3.generate({
			bindto : "#areachart",
			/* data : {
				columns : [ 
						[ '총 접속자 수', 300, 350, 300, 190, 50, 25 ],
						[ '로그인한 유저 수', 130, 100, 140, 200, 150, 50 ] 
				]
				
			} */
			data: {
				x: 'x',
				columns: [
					['x', '2018-03-28', '2018-03-29', '2018-03-30', '2018-03-31', '2018-04-01'],
					['방문자 수', 31, 48, 22, 77, 62]
				],
				type:'line',
				colors: {
					'데이터': '#F39C12'
				}
			},
			axis : {
			x : {
					type : 'timeseries',
					tick: {
							format: '%Y-%m-%d' /* %H:%M:%S */
					}
				}
			}
		});
	</script>
</body>
</html>