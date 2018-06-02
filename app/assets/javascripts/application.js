//= require rails-ujs

//= require jquery.min.js

//= require bootstrap.min.js
//= require detect.js
//= require fastclick.js
//= require jquery.slimscroll.js
//= require jquery.blockUI.js
//= require waves.js
//= require wow.min.js
//= require jquery.nicescroll.js
//= require jquery.scrollTo.min.js
//= require plugins/peity/jquery.peity.min.js
//= require plugins/waypoints/lib/jquery.waypoints.min.js
//= require plugins/counterup/jquery.counterup.min.js

//= require plugins/raphael/raphael-min.js
//= require plugins/jquery-knob/jquery.knob.js
//= require pages/jquery.dashboard.js
//= require plugins/morris/morris.min.js


//= require plugins/bootstrap-table/js/bootstrap-table.js
//= require pages/jquery.bs-table.js

//= require plugins/moment/moment.js

//= require plugins/timepicker/bootstrap-timepicker.js
//= require plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js


//= require plugins/sweet-alert2/sweetalert2.min.js



//= require jquery.core.js
//= require jquery.app.js
//= require pages/jquery.form-pickers.init.js


//= require_tree .

var resizefunc = [];
jQuery(document).ready(function($) {
    $('.counter').counterUp({
        delay: 100,
        time: 1200
    });

    $(".knob").knob();

});
      
