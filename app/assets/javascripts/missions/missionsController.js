
angular.module('codeGamed').controller('missionCtrl',function($scope,$routeParams,$location,$mdDialog,MissionsFactory){



    var levelId = $routeParams.level_id;

    MissionsFactory.validateLevel(levelId).then(function (res) {

        if (res.accessing_level_status == 'Success') {
            console.log(res.missions);
            $scope.missions = res.missions;
            $scope.myHTML = res.missions[res.last_mission_order - 1].problem;
            myCodeMirror.doc.setValue(res.missions[res.last_mission_order - 1].initial_code);
            $scope.current_mission = res.missions[res.last_mission_order - 1];
            $scope.mission_video = res.missions[res.last_mission_order - 1].video_url;

        } else {
            $location.path("/");
        }

        $scope.missions = res.missions;
    });


    $scope.play_mission = function (mission) {
        $scope.myHTML = mission.problem;
        $scope.mission_video = mission.video_url;

        myCodeMirror.doc.setValue(mission.initial_code);
        $scope.current_mission = mission;
    };

    $scope.submitAnswer = function () {
        alert('compiling code');
        var submitted_code = myCodeMirror.doc.getValue();

        MissionsFactory.compileCode(submitted_code,$scope.current_mission).then(function(res){
            $mdDialog.show(
                $mdDialog.alert()
                    .clickOutsideToClose(true)
                    .title('Code Status')
                    .textContent(res.output)
                    .ok('Next')
                    // Or you can specify the rect to do the transition from
                    .openFrom({
                        top: -50,
                        width: 30,
                        height: 80
                    })
                    .closeTo({
                        left: 1500
                    })
            );

        });
    };
    $scope.current_theme = 'dracula';
    $scope.themes = [
        'dracula', '3024-day', '3024-night', 'abcdef',
        'ambiance', 'ambiance-mobile', 'base16-dark', 'base16-light',
        'bespin', 'blackboard', 'cobalt', 'colorforth', 'eclipse', 'elegant',
        'erlang-dark', 'hopscotch', 'icecoder', 'isotope', 'lesser-dark',
        'liquibyte', 'material', 'mbo', 'mdn-like', 'midnight', 'monokai',
        'neat', 'neo', 'night', 'paraiso-dark', 'paraiso-light', 'pastel-on-dark',
        'railscasts', 'rubyblue', 'seti', 'solarized', 'the-matrix',
        'tomorrow-night-bright', 'tomorrow-night-eighties', 'ttcn',
        'twilight', 'vibrant-ink', 'xq-dark', 'xq-light', 'yeti', 'zenburn'
    ];
    $scope.update_theme = function () {
        myCodeMirror.setOption("theme", $scope.current_theme)
    }

});
angular.module('codeGamed').filter('trusted', ['$sce', function ($sce) {
    return function (url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
