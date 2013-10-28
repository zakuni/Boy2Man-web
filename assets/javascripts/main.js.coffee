$ ->
  $('#g').click => janken("g")
  $('#c').click => janken("c")
  $('#p').click => janken("p")

janken = (selected) ->
  $.get selected, (res) ->
      result = JSON.parse(res)
      trtd = '<tr><td>' + result["player"] + '</td><td>' + result["boy2man"] + '</td></tr>'
      $('table#result').prepend(trtd)