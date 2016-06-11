angular.module('codeGamed').controller('missionCtrl',function($scope,$timeout,$routeParams,$location,$mdDialog,
                                                              $mdSidenav,MissionsFactory){



    var levelId = $routeParams.level_id;



    $scope.isThemeSidenavOpen = false;
    $scope.openThemeMenu = function() {
        $mdSidenav('theme').toggle();

    };

    $scope.closeThemeMenu=function(){
        $mdSidenav('theme').close();

    };
    
    $scope.render_last_mission=function () {
        missions=$scope.missions
        missions_index=missions.length - 1;
        $scope.myHTML = missions[missions_index].mission_data.problem;
        myCodeMirror.doc.setValue(missions[missions_index].mission_data.initial_code);
        $scope.current_mission = missions[missions_index].mission_data;
        $scope.mission_video = missions[missions_index].mission_data.video_url;
        $scope.test_cases = missions[missions_index].mission_test_cases;
        
    }



    MissionsFactory.validateLevel(levelId).then(function (res) {

        if (res.accessing_level_status == 'Success') {
            //console.log(res.missions);
            $scope.missions = res.missions;
            //console.log(res.level_badge_url);
            $scope.badge = res.level_badge_url;
            $scope.locked_missions=res.locked_missions
            $scope.render_last_mission()
        } else {
            $location.path("/");
        }

    });


    $scope.play_mission = function (mission,event) {
        $(".animated").removeClass('animated infinite zoomIn')
        $(event.target).addClass('animated infinite zoomIn');


        $scope.myHTML = mission.mission_data.problem;
        $scope.mission_video = mission.mission_data.video_url;

        myCodeMirror.doc.setValue(mission.mission_data.initial_code);
        $scope.current_mission = mission.mission_data;
        $scope.test_cases = mission.mission_test_cases;

    };

    $scope.submitAnswer = function () {
        //alert('compiling code');
        $scope.loading = true;
        var submitted_code = myCodeMirror.doc.getValue();

        MissionsFactory.compileCode(submitted_code,$scope.current_mission).then(function(res){
            $scope.loading = false;
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
            )
            .then(function() {
                if(res.output == "Success") {
                    if (res.next_level == "same") {
                        $scope.missions = []
                        $timeout(function(){
                            $scope.missions = res.missions
                            $scope.locked_missions=res.locked_missions
                            $scope.render_last_mission()
                        },1800)

                    } else {
                        $location.path("/");
                    }
                }
            });

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

    $scope.update_theme = function(){
        myCodeMirror.setOption("theme", $scope.current_theme)
    };

}).directive("myCoolDirective", function() {
    return {
        restrict: "A",
        link: function(scope, elem, attrs) {
            $(elem).accordion({
                collapsible: true,
                active: false,
            });
        }
    }
});;


angular.module('codeGamed').filter('trusted', ['$sce', function ($sce) {
    return function (url) {
        return $sce.trustAsResourceUrl(url);
    };
}]);
angular.module('codeGamed').filter('range', function() {
    return function(input, total) {
        total = parseInt(total);

        for (var i=0; i<total; i++) {
            input.push(i);
        }

        return input;
    };
});
