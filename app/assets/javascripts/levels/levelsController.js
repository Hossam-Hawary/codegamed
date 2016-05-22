/**
 * Created by te7a on 18/05/16.
 */

angular.module('codeGamed').controller('levelCtrl',function($scope,showUserLevelsFactory){


    showUserLevelsFactory.showLevels().then(function(res){

        $scope.badges = res.badges

        var locked_levels = []
        
        for (var i=0; i< res.locked_levels;i++)
        {
            locked_levels.push(i);
        }
        $scope.locked_levels = locked_levels
        

    });

});