$ ->
  $('#g').click => janken("g")

janken = (hand) ->
  $.get hand, (res) ->
      console.log(res)
