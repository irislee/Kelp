// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function () {
    var maxL = 425;
    $('.blurb ').each(function (div) {
        var text = $(this).text();
        if (text.length > maxL) {

            var begin = text.substr(0, maxL),
                end = text.substr(maxL);

            $(this).html(begin)
                .append($('<a class="readmore"/>').attr('href', '#').html('...Read more'))
                .append($('<div class="hidden" />').html(end));
        }
    });
    // $(document).on('click', '.readmore', function () {
    //     $(this).html(function (_, ctr) {
    //         return (ctr == 'read more...') ? 'read less...' : 'read more...'
    //     });
    //     $(this).next('.hidden').slideToggle(750);
    // });
});