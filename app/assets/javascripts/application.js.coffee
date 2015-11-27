#= require jquery
#= require jquery_ujs
#= require libs/jquery.mb.bgndGallery/jquery.mb.bgndGallery
#= require libs/jquery-backstretch
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