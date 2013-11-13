win = lose = draw = 0

io = new RocketIO().connect()

$ ->
  $('#g').click => janken("グー")
  $('#c').click => janken("チョキ")
  $('#p').click => janken("パー")

  controller = new Leap.Controller()
  controller.connect()

  controller.on('frame', (frame) ->
    numberOfFingers = frame.fingers.length

    hand = frame.hands[0]
    if (hand?)
      console.log(hand.palmPosition)
      console.log(hand.fingers.length)
  )

io.on("connect", () ->
  console.log("connect!! "+io.session)
  console.log("type : "+io.type)
)

io.on("pon", (result) ->
  trtd = '<tr><td>' + result["player"] + '</td><td>' + result["boy2man"] + '</td></tr>'

  if result["winner"] == "player"
    win = win+1
    $('#win').html(win)
    $('table#result').prepend($(trtd).addClass('success'))
  else if result["winner"] == "boy2man"
    lose = lose+1
    $('#lose').html(lose)
    $('table#result').prepend($(trtd).addClass('danger'))        
  else
    draw = draw+1
    $('#draw').html(draw)
    $('table#result').prepend($(trtd).addClass('active'))
)

janken = (selected) ->
  io.push("janken", {hand: selected})      