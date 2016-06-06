/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').controller('listFriendsCtrl',function($scope,$mdSidenav,listUserFriendsFactory){

    listUserFriendsFactory.listFriends().then(function(res){
        $scope.friends = res.friends;
    });
    
    $scope.isSidenavOpen = false;
    $scope.openRightMenu = function() {

        listUserFriendsFactory.listFriends().then(function(res){
            $scope.friends = res.friends;
        });
        $mdSidenav('right').toggle();

    };

    $scope.closeRightMenu=function(){
        $mdSidenav('right').close();
        
    };


    
});