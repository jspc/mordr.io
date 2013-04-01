(jQuery(function($) {
	//	alert( "Started!" );
	
	$(".add_item").colorbox({
		iframe:true,
		innerWidth: 300,
		innerHeight: 400,
		onClosed:function(){ location.reload(true); },
	    });
	//	alert( "Got this far!" );
    })(jQuery));