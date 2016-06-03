angular.module('codeGamed').factory('showUserLevelsFactory', function ($http, $q) {


    return {

        showLevels: function () {
            var def = $q.defer();

            $http({

                'url': '/levels/show_user_levels',
                'method': 'post'

            }).success(function (res) {
                def.resolve(res);
            });

            return def.promise;
        }
    }

});