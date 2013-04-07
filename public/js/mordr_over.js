(jQuery(function($) {
    
    $(".add_item").colorbox({
	iframe:true,
	innerWidth: 300,
	innerHeight: 400,
	onClosed:function(){ location.reload(true); },
    });

    $(".search").typeahead([
	{
	    name:     'users',
	    prefetch: 'http://localhost:3001/search/users.json',
//	    header:   '<b>users:</b>',
	    footer:   '<br /><hr class="foot" />',
	    template: '<a class="list-item" href="/{{user}}/">{{user}}</a>',
	    engine:   Hogan,
	    limit:    10,
	},
	{
	    name: 'lists',
	    prefetch: 'http://localhost:3001/search/lists.json',
//	    header:   '<b>lists:</b>',
	    template: '<a class="list-item" href="/{{user}}/{{slug}}/">{{value}}<small> by {{user}} </small></a>',
	    engine:   Hogan,
	    limit:    10,
	},
    ]);

})(jQuery));
