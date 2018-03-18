/**
 * 
 */
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