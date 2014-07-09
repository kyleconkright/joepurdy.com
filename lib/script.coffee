$ ->

	$.ajax
		url: 'http://api.bandsintown.com/artists/Joe%20Purdy/events.json?artist_id=fbid_20396365540&api_version=2.0&app_id=jp'
		type: 'GET'
		dataType: 'jsonp'
		success: (results) ->
			$.each results, ->
				date = this.datetime.split "T"
				show = date[0].split "-"
				$('<ul></ul>')
				.append('<li class="frame">
					<div class="bit-4 date">' + show[1] + '-' + show[2] + '-' + show[0] + '</div>
					<div class="bit-2 city">' + this.venue.city + ', ' + this.venue.region + ' at ' + this.venue.name + '</div>
					<div class="bit-4 ticket"><a href="' + this.ticket_url + '">Buy Tickets <i class="fa fa-ticket"></i></a></div>	
					<div class="bit-1 descrip">' + if this.description? then this.description else "" + '</div>
					</li>')
				.appendTo('.shows')

	$.ajax
		url: '../data/data.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$('<div class="releases"></div>').appendTo('.music')
			$.each results.releases, ->
				title = this.title
				if not this.cd?
					cd = ''
				else	
					cd = ' / <a href="' + this.cd + '" target="_blank">CD</a>'

				if not this.player?
					player = ''
				else	
					player = '<a href="javascript:void(0);"  onclick="openWindow(\''+this.player+'\', \'follow\',530,395);">Listen</a>'
				
					
				$('<div class="release"></div>')
				.append('<h3>' + title + '</h3><img src="' + this.art + '"><p>' + player + '</p><p>Buy: <a href="' + this.mp3 + '" target="_blank">MP3</a>' + cd + '</p>')	
				.appendTo('.music .releases')


	insta_url = 'https://api.instagram.com/v1/users/1252139247/media/recent/?client_id=385c22dd2b964f459cc82e13ff7ed8a0&callback=?'
	
	$.ajax
		url: insta_url
		type: 'GET'
		dataType: 'jsonp'
		success: (data) ->
			$.each data.data, ->
				# if this.videos
				# 	media = '<div style="background-image: url(' + this.images.standard_resolution.url + ');"><a class="play" href="' + this.link + '></div>'
				# else
				# 	media = '<a href="' + this.link + '"><img src="' + this.images.standard_resolution.url +'"></a>'
				if this.id isnt '726060075961180685_1252139247'
					$('<a href="' + this.link + '"><img src="' + this.images.standard_resolution.url + '"></a><p>' + this.caption.text + '</p>').appendTo('.news')

	$("#signup").on "submit", (e) ->

        email = $("#email").val()
        source = $("#source_campaign").val()
        ref = $("#referring_url").val()
        id = $("#artist_id").val()

        e.preventDefault()
        $("#signup").addClass "loading"

        $.ajax
            url: "http://app.topspin.net/api/v1/fan/create_fan"
            type: "POST"
            dataType: "jsonp"
            data: (
                fan:
                    email: email
                    source_campaign: source
                    referring_url: ref
                    artist_id: id
            )
            success: (resp) ->
                $("#signup").removeClass "loading"
                $("#email").val "Check Your Inbox!"
                $("#email, #submit").prop "disabled", true