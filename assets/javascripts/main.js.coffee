$ ->
  $('#g').click => janken("g")
  $('#c').click => janken("c")
  $('#p').click => janken("p")

janken = (selected) ->
  $.get selected, (res) ->
      console.log(selected)
      console.log(res)

      if selected is "g"
        hand = "グー"
      else if selected is "c"
        hand = "チョキ"
      else if selected is "p"
        hand = "パー"
        
      trtd = '<tr><td>' + hand + '</td><td>' + res + '</td></tr>'
      $('table#result').prepend(trtd)