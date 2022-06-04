// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require bootstrap-sprockets
//= require jquery.mask
//= require jquery
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap-icons/font/bootstrap-icons.css'
import { autocompleteSearch } from '../components/autocomplete';
Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

var loader = setInterval(function () {
            if(document.readyState !== "complete") return;
            clearInterval(loader);
            autocompleteSearch();
         }, 300);