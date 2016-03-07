$(document).ready(function(){
  $('#query-submit').click(function(e){
    e.preventDefault();
    $('.search-results div').show();

    var query = $('#query').val();
    var resultsContainer = $('.search-results');
    removeStaleResults(resultsContainer);

    $.get('/search', {query: query}, function(data){

      var haveResults = false;
      data.artists.length > 0 || haveResults === true ? haveResults = true : haveResults = false
      data.albums.length > 0 || haveResults === true ? haveResults = true : haveResults = false
      data.songs.length > 0 || haveResults === true ? haveResults = true : haveResults = false
      if (!haveResults) {
        $(resultsContainer.parent()).append("<h4 id='no-results'>No Results</h4>");
        return;
      }

      for(var i = 0; i < data.artists.length; i++){
        var mediaContainer = resultsContainer.find('.artists').find('ul')

        var html = '<li><a href=/artists/' + data.artists[i].id;
        html += '>' + data.artists[i].name + '</a></li>';

        $(mediaContainer).append(html);
      }
      for(var i = 0; i < data.albums.length; i++){
        var mediaContainer = resultsContainer.find('.albums').find('ul')

        var html = '<li><a href=/albums/' + data.albums[i].id;
        html += '>' + data.albums[i].title + '</a></li>';

        $(mediaContainer).append(html);
      }
      for(var i = 0; i < data.songs.length; i++){
        var mediaContainer = resultsContainer.find('.songs').find('ul')

        var html = '<li><a href=/songs/' + data.songs[i].id;
        html += '>' + data.songs[i].title + '</a></li>';

        $(mediaContainer).append(html);
      }
    });
  });
});

function removeStaleResults(container) {
  container.find('li').remove()
  container.parent().find('#no-results').remove();
}
