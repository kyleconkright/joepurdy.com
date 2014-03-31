$ ->

	$.ajax
		url: 'http://api.bandsintown.com/artists/erichutchinson/events.json?callback=?&app_id=joepurdy'
		type: 'GET'
		dataType: 'jsonp'
		success: (results) ->
			$.each results, ->
				date = this.datetime.split "T"
				show = date[0].split "-"
				$('<ul></ul>')
				.append('<li><p class="date">' + show[1] + '-' + show[2] + '-' + show[0] + '</p><p>' + this.venue.city + ', ' + this.venue.region + ' <span>at</span> ' + this.venue.name + '</p><p class="ticket">Tickets <i class="fa fa-ticket"></i></li>')
				.appendTo('.shows')

	# $.ajax
	# 	url: 'data/data.json'
	# 	type: 'GET'
	# 	dataType: 'json'
	# 	success: (results) ->
			
