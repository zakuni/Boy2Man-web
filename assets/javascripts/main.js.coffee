win = lose = draw = 0

$ ->
  $('#g').click => janken("g")
  $('#c').click => janken("c")
  $('#p').click => janken("p")

janken = (selected) ->
  $.get selected, (res) ->
      result = JSON.parse(res)
      trtd = '<tr><td>' + result["player"] + '</td><td>' + result["boy2man"] + '</td></tr>'
      $('table#result').prepend(trtd)

      if result["winner"] == "player"
        win = win+1
        $('#win').html(win)
      else if result["winner"] == "boy2man"
        lose = lose+1
        $('#lose').html(lose)
      else
        draw = draw+1
        $('#draw').html(draw)