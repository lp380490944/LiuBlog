$(document).ready(function () {
<<<<<<< HEAD
  var $headerInner = $('.header-inner');
  var $sidebar = $('#sidebar');
  var getSidebarTop = function(){
    return $headerInner.height() + CONFIG.sidebar.offset;
  };
  var setSidebarMarginTop = function(sidebarTop){
    return $sidebar.css({ 'margin-top': sidebarTop });
  };
  var mql = window.matchMedia('(min-width: 991px)');
  setSidebarMarginTop(getSidebarTop()).show();
  mql.addListener(function(e){
    if(e.matches){
      setSidebarMarginTop(getSidebarTop());
    }
  });
=======
  var sidebarTop = $('.header-inner').height() + 10;

  $('#sidebar').css({ 'margin-top': sidebarTop }).show();
>>>>>>> 2fd209527d026c2001674f7c4647850c907649ec
});
