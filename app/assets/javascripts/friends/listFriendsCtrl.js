/**
 * Created by te7a on 05/06/16.
 */
angular.module('codeGamed').controller('listFriendsCtrl',function($scope,$mdSidenav,listUserFriendsFactory,$q,$mdDialog){


    
    $scope.isSidenavOpen = false;
    $scope.openRightMenu = function() {

        listUserFriendsFactory.listFriends().then(function(res){
            $scope.friends = res.friends;

            if(res.requests.length > 0) {
                $scope.requests = res.requests;

            }
        });

        listUserFriendsFactory.getUserScore().then(function(res){

            $scope.user_score = res.user_score;

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
    
    
    
    //Accepting And Declining Requests
    
    $scope.acceptRequest = function (friendRequest){

        listUserFriendsFactory.acceptFriendRequest(friendRequest.user_id).then(function(res){

            if(res.result == 'success'){
                //remove the request from pending
                var index= $scope.requests.indexOf(friendRequest);
                $scope.requests.splice(index,1);

                friendRequest['id'] = friendRequest.user_id;
                friendRequest['image'] =  friendRequest.image_url;
                friendRequest['score'] = res.friend_score;

                if ($scope.requests.length <= 0)
                    $scope.requests = false;

                 $scope.friends.push(friendRequest);
            }


        });
        
       
    }
    
    
    
    $scope.declineRequest = function (friendRequest){

        listUserFriendsFactory.declineFriendRequest(friendRequest.user_id).then(function(res){

            if(res.result == 'success'){

                //remove the request from pending
                var index= $scope.requests.indexOf(friendRequest);
                $scope.requests.splice(index,1);

                if ($scope.requests.length <= 0)
                    $scope.requests = false;
            }
        });
    }

    
    //removing a friend from friends
    $scope.removeFriend=function (friend){

      listUserFriendsFactory.declineFriendRequest(friend.id).then(function(res){

          if(res.result == 'success') {

              //remove friend from friend list
              var index = $scope.friends.indexOf(friend);
              $scope.friends.splice(index, 1);

          }

      });

    }

    
});