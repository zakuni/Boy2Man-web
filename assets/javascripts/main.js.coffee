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
        
      trth = '<tr id="result"><th>You</th><th>Boy2Man</th></tr>'
      trtd = '<tr><td>' + hand + '</td><td>' + res + '</td></tr>'
      $('tr#result').remove()
      $('table#result').prepend(trtd).prepend(trth)