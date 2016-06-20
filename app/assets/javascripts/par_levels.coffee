# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
unlockButton = (data)->
   $("#parLevelSubmit").prop('disabled', false)
   $('#productLookupResult').html(data.name)
   $('#productLookupResult').removeClass("alert-danger")
   $('#productLookupResult').addClass("alert-success")
   return
setCountPreference = (data)->
  $("#par_level_count_type").val(data.count_preference)
  return
alertNoCaseCount = (data)->
  $("#noCaseAmount").html("This product does not have a case amount")
  return
lockButtonError = (data)->
   $("#parLevelSubmit").prop('disabled', true)
   $('#productLookupResult').html("Cannot find Product")
   $('#productLookupResult').removeClass("alert-success")
   $('#productLookupResult').addClass("alert-danger")
   return
lockButtonEmpty = ()->
   $("#parLevelSubmit").prop('disabled', true)
   $('#productLookupResult').html("&nbsp;")
   $('#productLookupResult').removeClass("alert-danger")
   $('#productLookupResult').removeClass("alert-success")
   return
verifyProduct = (val)->
    $.get '/products.json?bhproduct_number=' + val,
      (data) ->
        unlockButton(data) if data.response == "OK"
        setCountPreference(data) if data.response == "OK"
        alertNoCaseCount(data) if data.case_count == 0
        lockButtonError(data) if data.response != "OK"
        return
    return
ready =  ->
   $("#par_level_bhproduct_number").blur ->
    val = $(this).val()
    if val != "" && val != null
      verifyProduct(val)
    else
      lockButtonEmpty()
    return
   return
focusField = ->
  $("#par_level_bhproduct_number").trigger("focus")
  return

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).ready(focusField)
$(document).on('page:load',focusField)