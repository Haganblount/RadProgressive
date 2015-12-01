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
#= require history_native.min
#= require libs/jquery-labelauty
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

  if $(window).width() > 400
    window.transitionParams = { rotate: '30deg', x: '550px' }
  else 
    window.transitionParams = { opacity: 0 }
  
  $(document).on 'change', '#new_card input[sync-with]', ->
    syncEl = $($(@).attr('sync-with'))

    if syncEl != undefined
      if syncEl.val() == null || syncEl.val() == ''
        $($(@).attr('sync-with')).val($(@).val())


