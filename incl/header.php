
<?php $FULLURL = 'http://joepurdy.com/'; ?>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Joe Purdy - Popup</title>
        <link rel="stylesheet" href="<?php echo $FULLURL ?>build/css/global.css">
        <meta name="viewport" content="width=device-width, maximum-scale=1.0" />
    </head>
    <body>

    <form id="signup" action="" method="">
        <label for="email">Signup for the Newsletter</label>
        <input id="email" name="fan[email]" type="email" placeholder="your email" class="erase email">  
        <input name="artist_id" value="239" id="artist_id" type="hidden">
        <input name="fan[source_campaign]" value="http://app.topspin.net/api/v1/artist/239/campaign/10003651" id="source_campaign" type="hidden">
        <input name="fan[referring_url]" value="http://www.joepurdy.com" id="referring_url" type="hidden">
        <!-- <input name="fan[confirmation_target]" value="http://labs.topspin.net/downloadanywhere/confirm.php?sessionid=188a0d0a116380c2180c37a7dcb33e1e" id="confirmation_target" type="hidden">           -->
        <input id="submit" name="submit" type="submit" value="submit">
    </form>

    <div id="container">
        <div class="frame">
            <div id="header" class="bit-1">
                <h1><a href="<?php echo $FULLURL ?>">joe purdy</h1>
                <a href="http://www.twitter.com/joepurdy" target="_blank"><i class="fa fa-twitter"></i></a>
                <a href="http://www.facebook.com/joepurdy" target="_blank"><i class="fa fa-facebook"></i></a>
                <a href="http://www.instagram.com/joepurdyofficial" target="_blank"><i class="fa fa-instagram"></i></a>
                <a href="https://itunes.apple.com/us/artist/joe-purdy/id57653144" target="_blank"><i class="fa fa-apple"></i></a>
                <a href="https://listen.beatsmusic.com/artists/ar198373" target="_blank"><img src="<?php echo $FULLURL ?>assets/img/beats.svg"></a>
                <a href="http://open.spotify.com/artist/3MCxkaTJmYKH0FZbe3rYxa" target="_blank"><img src="<?php echo $FULLURL ?>assets/img/spotify.svg"></a>
                <a href="<?php echo $FULLURL ?>music">music</a>
                <a href="<?php echo $FULLURL ?>shows">shows</a>
            </div><!--HEADER-->