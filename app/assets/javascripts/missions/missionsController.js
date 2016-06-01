angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,$location,MissionsFactory){


    var levelId = $routeParams.level_id;
    //console.log(levelId);

    MissionsFactory.validateLevel(levelId).then(function(res){

        if(res.accessing_level_status == 'Success'){
            $scope.missions = res.missions;
            console.log(res);
            $scope.myHTML = res.missions[res.last_mission_order - 1].problem;
            myCodeMirror.doc.setValue(res.missions[res.last_mission_order - 1].initial_code);
            $scope.current_mission = res.missions[res.last_mission_order - 1];

        }else {
            $location.path("/");
        }

        $scope.missions = res.missions;
    });


    $scope.play_mission = function(mission){
        //alert(mission_id);
        console.log(mission);
        //Video URL
        $scope.myHTML = mission.problem;
        myCodeMirror.doc.setValue(mission.initial_code);
        $scope.current_mission = mission;
    };

    $scope.submitAnswer = function(){
        alert('compiling code');
        var submitted_code = myCodeMirror.doc.getValue();
        MissionsFactory.compileCode(submitted_code,$scope.current_mission).then(function(res){
            alert(res.output);
        });
    };
    $scope.current_theme = 'dracula';
    $scope.themes = [
        'dracula','3024-day','3024-night','abcdef',
        'ambiance','ambiance-mobile','base16-dark','base16-light',
        'bespin','blackboard','cobalt','colorforth','eclipse','elegant',
        'erlang-dark','hopscotch','icecoder','isotope','lesser-dark',
        'liquibyte','material','mbo','mdn-like','midnight','monokai',
        'neat','neo','night','paraiso-dark','paraiso-light','pastel-on-dark',
        'railscasts','rubyblue','seti','solarized','the-matrix',
        'tomorrow-night-bright','tomorrow-night-eighties','ttcn',
        'twilight','vibrant-ink','xq-dark','xq-light','yeti','zenburn'
    ];
    $scope.update_theme=function () {
        myCodeMirror.setOption("theme",$scope.current_theme)


    }

});