(function() {
  $(function() {
    return $.ajax({
      url: 'http://api.bandsintown.com/artists/weezer/events.json?callback=?&app_id=joepurdy',
      type: 'GET',
      dataType: 'jsonp',
      success: function(results) {
        return $.each(results, function() {
          var date;
          date = this.datetime.split("T");
          return $('<ul></ul>').append('<li><p>' + date[0] + '</p><p>' + this.venue.city + ', ' + this.venue.region + '</p><p>' + this.venue.name + '</p><p class="ticket">Tickets <i class="fa fa-ticket"></i></li>').appendTo('.shows');
        });
      }
    });
  });

}).call(this);
