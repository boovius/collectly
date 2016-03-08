//= require helpers/angular_mocks
//= require search

describe('searchCtrl hasNoResults', function(){
  describe('searchCtrl', function(){
    var $scope;

    beforeEach(module('search'));

    beforeEach(inject(function($rootScope, $controller){
      $scope = $rootScope.$new();
      $controller('SearchCtrl', {$scope: $scope});
    }));

    it('with no data should be true if no results', function() {
      var data = {
        artists: [],
        albums: [],
        songs: [],
      }

      expect($scope.hasNoResults(data)).toBe(true);
    });

    it('with no data should be true if no results', function() {
      var data = {
        artists: ['johnny cash'],
        albums: [],
        songs: [],
      }

      expect($scope.hasNoResults(data)).toBe(false);
    });
  });
});
