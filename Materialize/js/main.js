document.addEventListener("DOMContentLoaded", function () {
    var elems = document.querySelectorAll(".sidenav");
    var instances = M.Sidenav.init(elems);
});
document.addEventListener("DOMContentLoaded", function () {
    var elems = document.querySelectorAll(".slider");
    var instances = M.Slider.init(elems, {
        indicators: false,
        height: 500,
        transition: 500,
        interval: 6000,
    });
});
document.addEventListener("DOMContentLoaded", function () {
    var elems = document.querySelectorAll(".scrollspy");
    var instances = M.ScrollSpy.init(elems);
});