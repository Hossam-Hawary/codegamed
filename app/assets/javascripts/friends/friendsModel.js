/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').factory('listUserFriendsFactory', function ($http, $q) {


    return {

        listFriends: function () {
            var def = $q.defer();

            $http({

                'url': '/main_page/list_user_friends',
                'method': 'get'

            }).success(function (res) {
                def.resolve(res);
            });

            return def.promise;
        }
    }

});