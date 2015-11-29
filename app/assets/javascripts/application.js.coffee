#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require "spin"
#= require "ladda"
#= require "ladda.jquery"
#= require libs/jquery.transit
#= require fancybox
#= require libs/jquery.mb.bgndGallery/jquery.mb.bgndGallery
#= require libs/jquery-backstretch
#= require libs/selectBoxIt
#= require card_items
#= require history_native.min
#= require_self

$ ->
  if gon.backgrounds.length > 0
    pageBackgrounds = new mbBgndGallery
      containment: 'body'
      timer: 4000
      effTimer: 2000
      grayScale: false
      effect: 'zoom'
      shuffle: true
      images: gon.backgrounds

  $('.select-box-it').selectBoxIt();

  $('a.fancybox').fancybox()

  $(document).on 'click', 'a.close[data-close]', ->
    $($(@).attr('data-close')).hide()
    false