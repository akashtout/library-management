// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'core-js/stable'
import 'regenerator-runtime/runtime'


require("jquery")
require("jquery")     
require("bootstrap")
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("@popperjs/core")


// import the application.scss we created for the bootstrap CSS (if you are not using assets stylesheet)
import "bootstrap"
import "../stylesheets/application"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

var jQuery = require('jquery')

global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;
//= require rails-ujs



Rails.start()
Turbolinks.start()
ActiveStorage.start()


import $ from 'jquery';
window.jQuery = $;
window.$ = $;
// Import the specific modules you may need (Modal, Alert, etc)
import { Tooltip, Popover } from "bootstrap"

// The stylesheet location we created earlier
require("../stylesheets/application.scss")




$(document).ready(function(){
 	$("#librarian_usertype").change('change', some_function)
 	
 	function some_function(e){
 		e.preventDefault();
 		let val = $("#librarian_usertype").val()
 		/*alert(val);*/
 		if( val == "librarian"){
 			$('.addfield').append('<input type="number" id="add_field_l" name="college_code" placeholder="Enter college code" />');
/* 				$('#add_field_s').remove();	
*/     	/*var input = +$("#inputid").val();*/
    }
    else{
/*    	$('.addfield').append('<input type="number" id="add_field_s" name="student_code" placeholder="Enter student code" />');	
*/    	$('#add_field_l').remove();
    }
  }

});


 

