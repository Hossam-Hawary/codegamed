angular.module('codeGamed').factory('showUserMissionsFactory',function($http,$q){


    return {

        validateLevel:function(level_id){

            console.log("Sending POST request to the Server")

            var def = $q.defer();

            $http({

                'url':'/missions/show_user_missions',
                'method':'post',
                'data': {
                    'level_id':level_id

                }
            }).success(function (res){
                console.log("Server Replied and Success");
                console.log(res.level_id)
                def.resolve(res);
            });

            return def.promise;
        }
    }

});