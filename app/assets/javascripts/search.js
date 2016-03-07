search = angular.module('search', []);

$(document).ready(function(){
  $('#query-submit').click(function(e){
    e.preventDefault();
    $('.search-results div').show();

    var query = $('#query').val();
    var resultsContainer = $('.search-results');
    removeStaleResults(resultsContainer);

    $.get('/search', {query: query}, function(data){
      var dataKeys = Object.keys(data);

      var haveResults = false;
      for(var i = 0; i < dataKeys.length; i++){
        var results = data[dataKeys[i]];
        results.length > 0 || haveResults === true ? haveResults = true : haveResults = false

        var mediaContainer = resultsContainer.find('.'+dataKeys[i]).find('ul')

        if (dataKeys[i] === 'artists') {
          var accessor = 'name';
        } else {
          var accessor = 'title';
        }

        for(var j = 0; j<results.length;j++){
          var html = '<li><a href=/' + dataKeys[i] + '/' + results[j].id;
          html += '>' +results[j][accessor]+'</a></li>';
          $(mediaContainer).append(html);
        }
      }
      if (!haveResults) {
        $(resultsContainer.parent()).append("<h4 id='no-results'>No Results</h4>");
      }
    });
  });
});

function removeStaleResults(container) {
  container.find('li').remove()
  container.parent().find('#no-results').remove();
}
