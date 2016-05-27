angular.module('codeGamed').factory('MissionsFactory',function($http,$q){


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
                //console.log("Server Replied and Success");
                //console.log(res);
                //console.log(res.missions);
                def.resolve(res);
            }).error(function(data){
                //console.log(data)
            });

            return def.promise;
        }
    }

    return {

        compileCode:function(submitted_code){

            console.log("Sending POST request to the Server")

            var def = $q.defer();

            $http({

                'url':'/missions/compile_user_code',
                'method':'post',
                'data': {
                    'submitted)code': submitted_code

                }
            }).success(function (res){
                console.log("Server Replied and Success");
                console.log(res);
                def.resolve(res);
            }).error(function(data){
                console.log(data)
            });

            return def.promise;
        }
    }

});