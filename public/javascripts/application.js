$().ready(function() {
  url = 'http://search.twitter.com/search.json?q=hartfordrb&callback=?'
  $.getJSON(url, function(data) {
    results = data.results.slice(0,5);
    $.each(results, function(n, result) {
      user_url = 'http://twitter.com/'+result.from_user;
      $('#tweets').
        append($('<li class="tweet clearfix">').attr('id','tweet_'+result.id).html(
          '<a href="'+user_url+'"><img src="'+ result.profile_image_url +'" alt="" /></a> '+result.text))
    });
  })
})