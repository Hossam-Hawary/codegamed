/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').controller('listFriendsCtrl',function($scope,$mdSidenav,listUserFriendsFactory,$q,$mdDialog){

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
        var def = $q.defer();
        if (searchText.trim() == '' )
            return [];




        listUserFriendsFactory.searchNewFriends(searchText).then(function(res){

         def.resolve(res.new_friends);

        });


      return def.promise;
    }




    //ajax request to add friend

    $scope.sendFriendRequest = function (friend){

        listUserFriendsFactory.sendFriendRequest(friend).then(function(res){
           if(res.result == 'success')
           {
               $scope.addFriend = false;
               $scope.searchText= '';

               $mdDialog.show(
                   $mdDialog.alert()
                       .parent(angular.element(document.querySelector('#popupContainer')))
                       .clickOutsideToClose(true)
                       .title('CodeGamed Friends Invitation')
                       .textContent('Friend Request Was Sent Succefully')
                       .ariaLabel('Alert Dialog Demo')
                       .ok('Close')

               );

           }
        });
    }
    
});