search = angular.module('search', []);

search.controller('SearchCtrl', function($scope){
  $('#query-submit').click(function(e){
    e.preventDefault();
    $('.search-results div').show();

    var query = $('#query').val();

    $.get('/search', {query: query}, function(data){
      $scope.artists = data.artists;
      $scope.albums = data.albums;
      $scope.songs = data.songs;

      $scope.noResults = hasNoResults(data);

      $scope.$apply();
    });
  });

  function hasNoResults(data){
    return hasZeroResults(data.artists) &&
      hasZeroResults(data.albums) &&
      hasZeroResults(data.songs);
  }

  function hasZeroResults(array) {
    return array.length === 0;
  }
});

