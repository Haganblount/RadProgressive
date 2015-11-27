$ ->
  $(document).on 'change', '.card-item-form.edit select', ->
    $(@).parents('form').trigger('submit')

  $(document).on 'change', '#card_item_count', ->
    form = $(@).parents('form')
    form.find('.price-label .price').text(gon.shirt_price * $(@).val())