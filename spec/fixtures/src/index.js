const logMessage = "ES6, Stimulus & Turbolinks with Jekyll on Webpack";
console.log(logMessage)

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import Turbolinks from "turbolinks"
Turbolinks.start();

import "turbolinks-animate";

import './main.css';

const fadeInTime = '0.4s'
const fadeOutTime= '0.3s'

document.addEventListener( 'turbolinks:load', function() {
  TurbolinksAnimate.init({ duration: fadeInTime, animation: 'fadein', element: document.querySelector('main.turbolinks-animate') });
});

document.addEventListener( 'turbolinks:before-visit', function(e) {
  let animatedMain = document.querySelector('main.turbolinks-animate')

  if(!animatedMain.classList.contains('transition-out')) {
    animatedMain.classList.add('transition-out')
    TurbolinksAnimate.init({ duration: fadeOutTime, animation: 'fadeout', element: document.querySelector('main.turbolinks-animate') });

    setTimeout(function() {
      Turbolinks.visit(e.data.url);
    }, 400);

    e.preventDefault();
  }

});

