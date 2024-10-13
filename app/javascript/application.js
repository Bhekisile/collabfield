// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
// require "@hotwired/turbo-rails"
// import "controllers"
// require gon

import "jquery"
import "jquery-ujs"
import "./posts/modal"
import "./posts/style"
import "./toggle_window"
import "./conversations/position_and_visibility"
import "./conversations/close"
import { Turbo } from "@hotwired/turbo-rails";

// console.log("application.js");
