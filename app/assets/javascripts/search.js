search = angular.module('search', ['ngRoute']);
search.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    .when('/folder', {
      template: '<div>hello {{folder.$location.url}} world</div>',
      controller: 'FolderCtrl',
      controllerAs: 'folder',
    });

  $locationProvider.html5Mode(true);
}]);

search.controller('FolderCtrl', ['$scope', '$location', function($scope, $location){
  this.$location = $location;
}]);

search.controller('SearchCtrl', function($scope){
  $scope.folder = {
    artists: [],
    albums: [],
    songs: [],
  };

  $('#query-submit').click(function(e){
    e.preventDefault();
    $('.search-results div').show();

    var query = $('#query').val();

    $.get('/search', {query: query}, function(data){
      $scope.artists = data.artists;
      $scope.albums = data.albums;
      $scope.songs = data.songs;

      if ($scope.hasNoResults(data)) {
        $scope.resultsMessage = 'no results'
      } else {
        $scope.resultsMessage = 'click an item to add to folder'
      };

      $scope.$apply();
    });
  });

  $scope.addToFolder = function() {
    if (this.hasOwnProperty('artist')) {
      $scope.folder.artists.push(this.artist);
    }
    if (this.hasOwnProperty('album')) {
      $scope.folder.albums.push(this.album);
    }
    if (this.hasOwnProperty('song')) {
      $scope.folder.songs.push(this.song);
    }
  }

  $scope.hasNoResults = function(data){
    return hasZeroResults(data.artists) &&
      hasZeroResults(data.albums) &&
      hasZeroResults(data.songs);
  }

  function hasZeroResults(array) {
    return array.length === 0;
  }
});

