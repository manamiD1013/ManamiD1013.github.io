$(function(){
	$('a[href^="#"]').click(function(){
		var speed = 500;
		var href= $(this).attr("href");
		var target = $(href == "#" || href == "" ? 'html' : href);
		var position = target.offset().top;
		$("html, body").animate({scrollTop:position}, speed, "swing");
		return false;
	});
});

$(function(){
var topBtn=$('#pageTop');
topBtn.hide();



//◇ボタンの表示設定
$(window).scroll(function(){
if($(this).scrollTop()>80){

//---- 画面を80pxスクロールしたら、ボタンを表示する
topBtn.fadeIn();

}else{

//---- 画面が80pxより上なら、ボタンを表示しない
topBtn.fadeOut();

}
});



// ◇ボタンをクリックしたら、スクロールして上に戻る
topBtn.click(function(){
$('body,html').animate({
scrollTop: 0},500);
return false;

});


});
