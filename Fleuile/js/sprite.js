$(function(){
  // #で始まるリンクをクリックしたら実行されます
  $('a[href^="#"]').click(function() {
    // スクロールの速度
    var speed = 400; // ミリ秒で記述
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $('body,html').animate({scrollTop:position}, speed, 'swing');
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
