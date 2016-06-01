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
        },

        compileCode:function(submitted_code,current_mission){

            console.log("Sending POST request to the Server")
            console.log(current_mission);

            var def = $q.defer();

            $http({

                'url':'/missions/compile_user_code',
                'method':'post',
                'data': {
                    'submitted_code': submitted_code,
                    'current_mission_id': current_mission.id
                }
            }).success(function (res){
                console.log("Server Replied and Success");
                def.resolve(res);
            }).error(function(data){
                console.log(data);
            });

            return def.promise;
        }


    }

});