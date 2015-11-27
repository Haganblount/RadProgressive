#= require jquery
#= require jquery_ujs
#= require libs/jquery-backstretch
#= require_self

$ ->
  if gon.backgrounds.length > 0
    $.backstretch(gon.backgrounds, duration: 4000)