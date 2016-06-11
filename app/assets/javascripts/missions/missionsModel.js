angular.module('codeGamed').factory('MissionsFactory', function ($http, $q) {


    return {

        validateLevel: function (level_id) {

            var def = $q.defer();

            $http({

                'url': '/missions/show_user_missions',
                'method': 'post',
                'data': {
                    'level_id': level_id

                }
            }).success(function (res) {
                def.resolve(res);
            }).error(function (data) {
            });

            return def.promise;
        },

        compileCode: function (submitted_code, current_mission) {

            var def = $q.defer();


            $http({

                'url': '/missions/compile_user_code',
                'method': 'post',
                'data': {
                    'submitted_code': submitted_code,
                    'current_mission_id': current_mission.id
                }
            }).success(function (res) {
                def.resolve(res);
            }).error(function (data) {
                alert("Something wrong with connection!");
            });

            return def.promise;
        }


    }

});