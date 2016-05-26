angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,$location,showUserMissionsFactory){

    $scope.myHTML = '<strong> Hellloooo World !!! </strong>';
    var levelId = $routeParams.level_id;
    //console.log(levelId);

    showUserMissionsFactory.validateLevel(levelId).then(function(res){

        //console.log("From Controller");
        //console.log(res);


        if(res.accessing_level_status == 'Success'){
            $scope.missions = res.missions;
        }else {
            $location.path("/");
        }

        $scope.missions = res.missions;
    });


});