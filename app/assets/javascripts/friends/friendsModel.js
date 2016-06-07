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
        },

        searchNewFriends: function(search_word){
            var def = $q.defer();
            $http({

                'url': "/main_page/"+search_word+"/search_for_new_friends",
                'method': 'get'

            }).success(function (res) {
                def.resolve(res);
            });

            return def.promise;

        },
        
        
        sendFriendRequest: function(friend){
            var def = $q.defer();
            $http({
                'method':'post',
                'url':'/friendships',
                'data':{'friend_id':friend.id}
                
            }).success(function(res){
                def.resolve(res);        
            });
                
            return def.promise;
        },
        
        
        acceptFriendRequest: function(friend_id){
            var def = $q.defer();
            
            $http({
                'method':'put',
                'url': ' /friendships/'+friend_id
            }).success(function(res){
                
                def.resolve(res);
            });
            
            
            return def.promise;
            
        }
    }

});