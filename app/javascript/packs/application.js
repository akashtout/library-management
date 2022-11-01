// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

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

//= require bootstrap-sprockets
//= require jquery-ui
//= require jquery
//= require jquery_ujs
//= require popper
//= require turbolinks
//= require bootstrap
//= require_tree.

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


