(function() {
  $(function() {
    var insta_url;
    $.ajax({
      url: 'http://api.bandsintown.com/artists/Joe%20Purdy/events.json?artist_id=fbid_20396365540&api_version=2.0&app_id=jp',
      type: 'GET',
      dataType: 'jsonp',
      success: function(results) {
        return $.each(results, function() {
          var date, show;
          date = this.datetime.split("T");
          show = date[0].split("-");
          return $('<ul></ul>').append('<li class="frame"> <div class="bit-4 date">' + show[1] + '-' + show[2] + '-' + show[0] + '</div> <div class="bit-2 city">' + this.venue.city + ', ' + this.venue.region + ' at ' + this.venue.name + '</div> <div class="bit-4 ticket"><a href="' + this.ticket_url + '">Buy Tickets <i class="fa fa-ticket"></i></a></div> <div class="bit-1 descrip">' + (this.description != null ? this.description : "" + '</div> </li>')).appendTo('.shows');
        });
      }
    });
    $.ajax({
      url: '../data/data.json',
      type: 'GET',
      dataType: 'json',
      success: function(results) {
        $('<div class="releases"></div>').appendTo('.music');
        return $.each(results.releases, function() {
          return $('<div class="release"></div>').append('<h3>' + this.title + '</h3><img src="' + this.art + '"><p><a href="javascript:void(0);"  onclick="openWindow(\'' + this.player + '\', \'follow\',530,395);">Listen</a></p><p>Buy: <a href="' + this.mp3 + '" target="_blank">MP3</a> / <a href="' + this.cd + '" target="_blank">CD</a></p>').appendTo('.music .releases');
        });
      }
    });
    insta_url = 'https://api.instagram.com/v1/users/1252139247/media/recent/?client_id=385c22dd2b964f459cc82e13ff7ed8a0&count=3&callback=?';
    return $.ajax({
      url: insta_url,
      type: 'GET',
      dataType: 'jsonp',
      success: function(data) {
        return $.each(data.data, function() {
          var media;
          if (this.videos) {
            media = this.videos.standard_resolution.url;
          } else {
            media = this.link;
          }
          return $('<a href="' + media + '" target="_blank"> <img src="' + this.images.standard_resolution.url + '"></a> <p>' + this.caption.text + '</p>').appendTo('.news');
        });
      }
    });
  });

}).call(this);
