/**
 * Created by te7a on 18/05/16.
 */

angular.module('codeGamed').controller('levelCtrl', function ($scope, showUserLevelsFactory) {



    
    showUserLevelsFactory.showLevels().then(function (res) {

        $scope.badges = res.badges
        $scope.locked_levels = res.locked_levels
       
    });

});

angular.module('codeGamed')
    .controller('allLevelsCtrl', function () {

    });
