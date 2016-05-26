angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,$location,showUserMissionsFactory){


    var levelId = $routeParams.level_id;
    //console.log(levelId);

    showUserMissionsFactory.validateLevel(levelId).then(function(res){

        if(res.accessing_level_status == 'Success'){
            $scope.missions = res.missions;
        }else {
            $location.path("/");
        }

        $scope.missions = res.missions;
    });


    $scope.play_mission = function(mission){
        //alert(mission_id);
        console.log(mission);
        $scope.myHTML = mission.problem;
        myCodeMirror.doc.setValue(mission.initial_code);
    }
});