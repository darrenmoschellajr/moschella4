# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unlockButton = (data)->
   $("#detailsSubmit").prop('disabled', false)
   $('#productLookupResult').html(data.name)
   $('#productLookupResult').removeClass("alert-danger")
   $('#productLookupResult').addClass("alert-success")
   return
lockButtonError = (data)->
   $("#detailsSubmit").prop('disabled', true)
   $('#productLookupResult').html("Cannot find Product")
   $('#productLookupResult').removeClass("alert-success")
   $('#productLookupResult').addClass("alert-danger")
   return
lockButtonEmpty = ()->
   $("#detailsSubmit").prop('disabled', true)
   $('#productLookupResult').html("&nbsp;")
   $('#productLookupResult').removeClass("alert-danger")
   $('#productLookupResult').removeClass("alert-success")
   return
verifyProduct = (val)->
    $.get '/products.json?bhproduct_number=' + val,
      (data) ->
        unlockButton(data) if data.response == "OK"
        lockButtonError(data) if data.response != "OK"
        return
    return
ready =  ->
   $("#detail_bhproduct_number").blur ->
    val = $(this).val()
    if val != "" && val != null
      verifyProduct(val)
    else
      lockButtonEmpty()
    return
   return
focusField = ->
  $("#detail_bhproduct_number").trigger("focus")
  return

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).ready(focusField)
$(document).on('page:load',focusField)