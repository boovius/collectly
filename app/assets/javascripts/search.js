$(document).ready(function(){
  $('#query-submit').click(function(){
    var query = $('#query').val();

    $.get('/search', {query: query}, function(data){
      var resultsContainer = $('.search-results');

      var dataKeys = Object.keys(data);

      for(var i = 0; i < dataKeys.length; i++){
        var results = data[dataKeys[i]];
        var mediaContainer = resultsContainer.find('.'+dataKeys[i]).find('ul')

        if (dataKeys[i] === 'artists') {
          var accessor = 'name';
        } else {
          var accessor = 'title';
        }

        for(var j = 0; j<results.length;j++){
          $(mediaContainer).append('<li>'+results[j][accessor]+'</li>');
        }
      }
    });
  });
});
