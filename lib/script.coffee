$ ->

	$.ajax
		url: 'http://api.bandsintown.com/artists/joepurdy/events.json?callback=?&app_id=joepurdy'
		type: 'GET'
		dataType: 'jsonp'
		success: (results) ->
			$.each results, ->
				date = this.datetime.split "T"
				show = date[0].split "-"
				$('<ul></ul>')
				.append('<li><p class="date">' + show[1] + '-' + show[2] + '-' + show[0] + '</p><p>' + this.venue.city + ', ' + this.venue.region + ' <span>at</span> ' + this.venue.name + '</p><p class="ticket">Tickets <i class="fa fa-ticket"></i></li>')
				.appendTo('.shows')

	$.ajax
		url: 'data/data.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$('<div class="releases"></div>').appendTo('.music')
			$.each results.releases, ->	
				$('<div class="release"></div>')
				.append('<h3>' + this.title + '</h3><img src="' + this.art + '"><p><a href="#">Listen</a></p><p>Buy: <a href="#">MP3</a> / <a href="#">CD</a></p>')	
				.appendTo('.music .releases')


