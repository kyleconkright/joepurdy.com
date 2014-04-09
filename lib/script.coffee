$ ->

	$.ajax
		url: 'http://api.bandsintown.com/artists/joepurdy/events.json?callback=?&app_id=joepurdy'
		type: 'GET'
		dataType: 'jsonp'
		success: (results) ->
			$.each results, ->
				console.log 'hello'
				date = this.datetime.split "T"
				show = date[0].split "-"
				$('<ul></ul>')
				.append('<li><p class="date">' + show[1] + '-' + show[2] + '-' + show[0] + '</p><p>' + this.venue.city + ', ' + this.venue.region + ' <span>at</span> ' + this.venue.name + '</p><a class="ticket">Tickets <i class="fa fa-ticket"></i></a></li>')
				.appendTo('.shows')

	$.ajax
		url: '../data/data.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$('<div class="releases"></div>').appendTo('.music')
			$.each results.releases, ->	
				$('<div class="release"></div>')
				.append('<h3>' + this.title + '</h3><img src="' + this.art + '"><p><a href="javascript:void(0);"  onclick="openWindow(\''+this.player+'\', \'follow\',530,395);">Listen</a></p><p>Buy: <a href="#">MP3</a> / <a href="#">CD</a></p>')	
				.appendTo('.music .releases')


	insta_url = 'https://api.instagram.com/v1/users/1252139247/media/recent/?client_id=385c22dd2b964f459cc82e13ff7ed8a0&count=3&callback=?'
	
	$.ajax
		url: insta_url
		type: 'GET'
		dataType: 'jsonp'
		success: (data) ->
			$.each data.data, ->
				console.log this.images.standard_resolution.url + ' ' + this.caption.text
				$('<a href="' + this.link + '" target="_blank"><img src="' + this.images.standard_resolution.url + '"></a><p>' + this.caption.text + '</p>').appendTo('.news')