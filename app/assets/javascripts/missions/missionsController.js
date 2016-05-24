angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,showUserMissionsFactory){

    $scope.myHTML = '<strong> Hellloooo World !!! </strong>';

    var levelId = $routeParams.level_id;
    console.log(levelId);

    showUserMissionsFactory.validateLevel(levelId);


});