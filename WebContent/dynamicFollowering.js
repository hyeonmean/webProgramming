function followerPrint(isEmpty, follower_array, followerProfileList_array){

    fillTemplate = function(follower_name, follwerProfileLocation){
		var followtemplate =`
		<div class="l-follower">
            <div class="userPhoto">
                <img src= "${follwerProfileLocation}"/>
            </div>
            <div class="username">${follower_name}</div>
            <div class="follow-status">팔로우</div>
        </div>`;
		
    	return template;
	}

	var follower_name='followername', follwerProfileLocation='followerloc';

	if (isEmpty == false)
		return;

	for(var i =0; i < follower_array.length; i++){
		//변수수정 코드 이부분에 삽입
		follower_name = follower_array[i];
		follwerProfileLocation = followerProfileList_array[i];
		document.write(fillTemplate(follower_name, follwerProfileLocation));
	}
}

function followingPrint(isEmpty, following_array, followingProfileList_array){

    fillTemplate = function(following_name, followingProfileLocation){
		var followtemplate =`
		<div class="l-following">
            <div class="userPhoto">
                <img src= "${followingProfileLocation}"/>
            </div>
            <div class="username">${following_name}</div>
            <div class="follow-status">팔로우</div>
        </div>`;
		
    	return followtemplate;
	}

	var following_name='followingname', followingProfileLocation='followingloc';

	if (isEmpty == false)
		return;

	for(var i =0; i < following_array.length; i++){
		//변수수정 코드 이부분에 삽입
		following_name = following_array[i];
		followingProfileLocation = followingProfileList_array[i];
		document.write(fillTemplate(following_name, followingProfileLocation));
	}
}