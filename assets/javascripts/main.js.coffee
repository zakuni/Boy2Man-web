$ ->
  $('#g').click => janken("g")
  $('#c').click => janken("c")
  $('#p').click => janken("p")

janken = (hand) ->
  $.get hand, (res) ->
      console.log(res)
