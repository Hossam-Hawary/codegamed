/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').controller('listFriendsCtrl',function($scope,$mdSidenav,listUserFriendsFactory,$q){

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



    // search for a new friends

    
    $scope.selectedItemChange=function(item){

        if (typeof(item) != "undefined")
        {

            $scope.addFriend=item;
        }

        else{

            $scope.addFriend=false;
        }

    }

    $scope.searchTextChange=function(searchText){

        if (searchText.trim() == '')
            return [];


        var def = $q.defer();

        listUserFriendsFactory.searchNewFriends(searchText).then(function(res){

            def.resolve(res.new_friends);
        });

       
     return def.promise;

    }
    
});