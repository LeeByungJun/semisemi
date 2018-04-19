var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

$(document).ready(function(){

	if(location.hash) {	
		var hash = location.hash.substring(1);

		var pairs = hash.split('&');

		if(pairs[0]){
		var brandVal = pairs[0].split('=')[1];
		}
		if(pairs[1]){
			var typeVal = pairs[1].split('=')[1];
			$('#selectType option[value='+typeVal+']').attr('selected','selected');
		}
		if(pairs[2]){
			var fuelVal = pairs[2].split('=')[1];
			$('#selectFuel option[value='+fuelVal+']').attr('selected','selected');
		}
		var page = getUrlParameter('page');
		if(pairs[0].split('=')[1]!="view"){
			getCar(brandVal,typeVal,fuelVal, page);			
		}else{
			history.back();
		}


	}else{
		getCar();
	}
});

$(window).bind('hashchange', function() { 
	var hash = location.hash.substring(1);

	var pairs = hash.split('&');

	if(pairs[0]){
		var brandVal = pairs[0].split('=')[1];
	}
	if(pairs[1]){
		var typeVal = pairs[1].split('=')[1];
		$('#selectType option[value='+typeVal+']').attr('selected','selected');
	}
	if(pairs[2]){
		var fuelVal = pairs[2].split('=')[1];
		$('#selectFuel option[value='+fuelVal+']').attr('selected','selected');
	}
	var page = getUrlParameter('page');
	if(pairs[0].split('=')[1]!="view"){
		getCar(brandVal,typeVal,fuelVal, page);
	}
});


function getCar(brand,type,fuel,page){
	if(typeof brand === "undefined") brand = "";
	if(typeof type === "undefined") type = "";
	if(typeof fuel === "undefined") fuel = "";
	if(typeof page === "undefined") page = "";
	document.location.hash = "brand="+brand+"&type="+type+"&fuel="+fuel;
	

	var view_link = '/ajax/ajax_car.php';
	$.ajax({
		type: 'POST',
		url: view_link,
		data: { brand_seq : brand , type : type , fuel : fuel , page : page},
		success: function (data) {
			
			$('#carList').empty().html(data).fadeIn('slow');

			$( "ul.brand li.brandLogo" ).each(function( index ) {
				$(this).removeClass("active");
			});
			$('.brand_'+brand).addClass("active");
			
			$('#selectBrand option').removeAttr('selected').filter('[value='+brand+']').attr('selected', true);

		},
		complete:function(){
			$('#carDetail').html("");
		}
	});
}

function viewCar(no,buy){
	var view_link = '/ajax/ajax_viewcar.php';
	
	$.ajax({
		type: 'POST',
		url: view_link,
		data: { seq : no , buytype : buy},
		success: function (data) {			
			$('#carDetail').html("").html(data).fadeIn('slow');
			document.location.hash = "mode=view";

		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		},
		complete:function(){
			$('.wrap-loading').addClass('display-none');
			$('#carList').hide('fast');
		}
	});
}

function getOption(no){
	var view_link = '/ajax/ajax_option.php';
	$.ajax({
		type: 'POST',
		url: view_link,
		data: { type_seq : no },
		success: function (data) {
			$('#carGrade').html(data);	
			var carVal = $('#carGrade').val();
			getOptionList(carVal);
			
		}
	});
	
}

function getOptionList(no){
	var view_link = '/ajax/ajax_optionlist.php';
	$.ajax({
		type: 'POST',
		url: view_link,
		data: { seq : no },
		success: function (data) {
			$('#carOption').html(data);				
		}
	});

	var price_link = '/ajax/ajax_getprice.php';
	$.ajax({
		type: 'POST',
		url: price_link,
		data: { seq : no },
		success: function (data) {
			$('#getPrice').text(data.replace(/\n/g, "")+"원");
			$('#getTotalPrice').text(data.replace(/\n/g, "")+"원");
			$('#getTotalPriceInput').val(data.replace(/(,)/g,""));
			
		}
	});
}

function getOptionPrice(){

	var price = $('.optionPrice');

	var total = 0;
	var totalPrice = $("#getTotalPriceInput").val();

	price.each(function() {
		if ($(this).is(":checked"))
			total = parseInt(total) + parseInt($(this).val());
	});
	
	$("#getOptionPrice").text(comma(total)+"원");
	$("#getTotalPrice").text(comma(parseInt(totalPrice)+total)+"원");

}

function getLeaseValue(){
	var totalPrice = $("#getTotalPriceInput").val();
}

function closeDetail(){
	$('#carDetail').html("");
	$('#carList').fadeIn('slow');		

}