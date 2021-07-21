$(function() {//페이지가 로딩될때
	showList();
});//page loading function end  

var replyUL = $(".chat");
function showList() {
	replyService.getList({ bbsno: bbsno, sno: sno, eno: eno },
		function(list) {
			var str = "";
			if (list == null || list.length == 0) {
				return;
			}

			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='list-group-item' data-rnum='" + list[i].rnum + "'>";
				str += "<div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
				str += "<small class='pull-right text-muted'>" + list[i].regdate + "</small></div>";
				str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
			}

			replyUL.html(str);

			showReplyPage();
		}//function end

	);//getList end
}//showList end
function replaceAll(str, searchStr, replaceStr) {
	return str.split(searchStr).join(replaceStr);
}

var replyPageFooter = $(".panel-footer");

var param = "nPage=" + nPage;
param += "&nowPage=" + nowPage;
param += "&bbsno=" + bbsno;
param += "&col=" + colx;
param += "&word=" + wordx;

function showReplyPage() {

	replyService.getPage(param,
		function(paging)  {
			//console.log(paging);
			var str = "<div><small class='text-muted'>" + paging + "</small></div>";

			replyPageFooter.html(str);
		})

}//showReplyPage end

var modal = $(".modal");
var modalInputContent = modal.find("textarea[name='content']");

var modalModBtn = $("#modalModBtn");
var modalRemoveBtn = $("#modalRemoveBtn");
var modalRegisterBtn = $("#modalRegisterBtn");

$("#modalCloseBtn").on("click", function(e) {

	modal.modal('hide');
});


$("#addReplyBtn").on("click", function(e) {
	modalInputContent.val("");
	modal.find("button[id !='modalCloseBtn']").hide();

	modalRegisterBtn.show();

	$(".modal").modal("show");

});


modalRegisterBtn.on("click", function(e) {

	if (modalInputContent.val() == '') {
		alert("댓글을 입력하세요")
		return;
	}

	var reply = {
		content: modalInputContent.val(),
		id: 'user1',
		bbsno: bbsno
	};
	//alert(reply.bbsno);
	replyService.add(reply, function(result) {

		//alert(result);

		modal.find("input").val("");
		//alert(modal.find("input"));
		console.log("input?");
		console.log(modal.find("input"));
		modal.modal("hide");

		//showList(1);
		showList();

	}); //end add

}); //end modalRegisterBtn.on


//댓글 조회 클릭 이벤트 처리 
$(".chat").on("click", "li", function(e) {

	var rnum = $(this).data("rnum");

	//alert(rnum)
	replyService.get(rnum, function(reply) {
		console.log("reply?");
		console.log(reply);
		modalInputContent.val(reply.content);
		modal.data("rnum", reply.rnum);

		modal.find("button[id !='modalCloseBtn']").hide();

		modalModBtn.show();
		modalRemoveBtn.show();

		$(".modal").modal("show");

	});
});

//댓글 수정
modalModBtn.on("click", function(e) {

	var reply = { rnum: modal.data("rnum"), content: modalInputContent.val() };
	//alert(reply.rnum);
	replyService.update(reply, function(result) {

		//alert(result);
		modal.modal("hide");
		showList();

	});

});//modify 

//댓글 삭제
modalRemoveBtn.on("click", function(e) {

	var rnum = modal.data("rnum");

	replyService.remove(rnum, function(result) {

		//alert(result);
		modal.modal("hide");
		showList();

	});

});//remove