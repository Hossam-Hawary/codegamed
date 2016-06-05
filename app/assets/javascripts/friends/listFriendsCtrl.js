/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').controller('listFriendsCtrl',function($scope,$mdSidenav){

    $scope.isSidenavOpen = false;
    $scope.openRightMenu = function() {
        $mdSidenav('right').toggle();

    };

    $scope.closeRightMenu=function(){
        $mdSidenav('right').close();


    };
    
        
    
});