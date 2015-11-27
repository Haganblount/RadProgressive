#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require jquery.turbolinks
#= require jquery-ui/sortable
#= require turbolinks
#= require s3_direct_upload
#= require_self

$ ->  
  $('#s3-uploader').S3Uploader(remove_completed_progress_bar: false)

  $('.sort-photos').sortable
    stop: (event, ui) ->
      url = $(@).data('url');
      ids = []

      $('.files > .photo').each (index, item) ->
        ids.push($(item).data('id'))
        
      $.ajax(
        url: url,
        data: {ids: ids},
        dataType: 'JSON',
        method: 'POST'
      )