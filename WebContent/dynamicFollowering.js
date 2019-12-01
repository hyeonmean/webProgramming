function followerPrint(follower_array, followerProfileList_array){

    fillTemplate = function(follower_name, follwerProfileLocation){
		var template =`	<div class="l-follower">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">${follower_name}</div>
                        <div class="follow-status">${follwerProfileLocation}</div>
                    </div>`;
		
    	return template;
	}

	var follower_name, follwerProfileLocation;

	for(var i =0; i < follower_array.length; i++){
		//변수수정 코드 이부분에 삽입
		follower_name = follower_array[i];
		follwerProfileLocation = followerProfileList_array[i];
		document.write(fillTemplate(follower_name, follwerProfileLocation));
	}
}

function followingPrint(following_array, followingProfileList_array){

    fillTemplate = function(following_name, followingProfileLocation){
		var template =`	<div class="l-following">
                        <div class="userPhoto">
                            <img src= "profile.jpg"/>
                        </div>
                        <div class="username">${following_name}</div>
                        <div class="follow-status">${followingProfileLocation}</div>
                    </div>`;
		
    	return template;
	}

	var following_name, followingProfileLocation;

	for(var i =0; i < following_array.length; i++){
		//변수수정 코드 이부분에 삽입
		following_name = following_array[i];
		followingProfileLocation = followingProfileList_array[i];
		document.write(fillTemplate(following_name, followingProfileLocation));
	}
}