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
#= require libs/jquery-labelauty
#= require_self

$ ->
  if gon.backgrounds.length > 0
    if $(window).width() > 400
      pageBackgrounds = new mbBgndGallery
        containment: 'body'
        timer: 4000
        effTimer: 2000
        grayScale: false
        effect: 'zoom' if $(window).width() > 400
        shuffle: true
        images: gon.backgrounds
        preserveTop: true
    else
      el = $('img#backgrounds')
      counter = 1
      el.attr('src', gon.backgrounds[0])

      setInterval(->
        counter += 1
        if counter >= gon.backgrounds.length
          counter = 0
        
        el.attr('src', gon.backgrounds[counter])
      , 4000)


      

  if $(window).width() > 400
    window.transitionParams = { rotate: '30deg', x: '550px' }
  else 
    window.transitionParams = { opacity: 0 }
  

  $(document).on 'input', '.form-group.has-error input', ->
    formGroupEl = $(@).parents('.form-group')
    formGroupEl.find('.help-block').addClass('hidden')
    formGroupEl.removeClass('has-error')

  $('input[name="card_item[is_man]"][type="checkbox"]').change ->
    option = $('#card_item_size option[value="2XL"]')
    boxOption = $('li[data-val="2XL"]')
    box = $('#card_item_size').data("selectBox-selectBoxIt")
  
    if $(@).is(':checked')
      box.enableOption(option.index())
    else
      box.disableOption(option.index())
  
  $(document).on 'click', '.close', ->
    $(@).parents('.closed').hide()
    return false

  setTimeout ( ->
    $('.panel.subscribe.hidden').removeClass('hidden')
  ), 20000
      
      



