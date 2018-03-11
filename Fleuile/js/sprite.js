$(function(){
   // #で始まるアンカーをクリックした場合に処理
   $('a[href^=#]').click(function() {
      // スクロールの速度
      var speed = 400; // ミリ秒
      // アンカーの値取得
      var href= $(this).attr("href");
      // 移動先を取得
      var target = $(href == "#" || href == "" ? 'html' : href);
      // 移動先を数値で取得
      var position = target.offset().top;
      // スムーススクロール
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
