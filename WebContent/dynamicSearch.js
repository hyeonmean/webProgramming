function searchListPrint(post_array, picture_array){
	//쿼리로 검색 단어에 맞는 사진만 가져와야할 것. 뽑아와서 경로를 리스트로 작성해 for문으로 print
	//아래의 변수 초기화값은 나중에 삭제할 예정
	var theNumberOfSearchResult = post_array.length;	
	document.write(`<div class="columns">`);
	
	for(var i = 0; i < theNumberOfSearchResult; i++){
		document.write(`<a href="FeedDetail.jsp?${post_array[i]}"><figure><img src="${picture_array[i]}"/></figure></a>`);
	}
	
	//document.write('</div>');
	/* 나중에 db해결되면 이곳 함수를 사용
	for(var i = 0; i < theNumberOfSearchResult; i++){
		//변수수정 코드 이부분에 삽입
		document.write(`<figure><img src="${locationList[i]}"/></figure>`);
	}
	*/
	document.write(`</div>`);
}

function printKeyword(searchKeyword){
	var keyword = searchKeyword;
	document.write(`<div class="keyword">#${keyword}</div>`);
	
}