angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,$location,MissionsFactory){


    var levelId = $routeParams.level_id;
    //console.log(levelId);

    MissionsFactory.validateLevel(levelId).then(function(res){

        if(res.accessing_level_status == 'Success'){
            $scope.missions = res.missions;
            console.log(res);
            $scope.myHTML = res.missions[res.last_mission_order - 1].problem;
            myCodeMirror.doc.setValue(res.missions[res.last_mission_order - 1].initial_code);

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
    };

    $scope.submitAnswer = function(){
        alert('compiling code');
        var submitted_code = myCodeMirror.doc.getValue();
        MissionsFactory.submitAnswer(submitted_code);
    };
});