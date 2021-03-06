# -*- coding: utf-8 -*-
require 'json'
Slim::Engine.set_default_options :pretty => true

class App < Sinatra::Base
  register Padrino::Sprockets
  sprockets
  register Padrino::Helpers
  register Sinatra::RocketIO
  io = Sinatra::RocketIO

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  io.on :connect do |client|
    @janken ||= Hash.new
    @janken[client.session] ||= Boy2Man::Janken.new
  end

  io.on :janken do |data, client|
    player_hand = data['hand']
    opponent = @janken[client.session].pon(player_hand)
    winner = case Boy2Man.judge(player_hand, opponent)
    when player_hand
      "player"
    when opponent
      "boy2man"
    else
      nil
    end
    io.push :pon,
      {:player => player_hand, :boy2man => opponent, :winner => winner},
      {:to => client.session}
  end

  get '/' do
    slim :index, :locals => {:title => "Boy2Man"}
  end

  before do
    session["boy2man"] ||= Boy2Man::Janken.new
    @janken = session["boy2man"]
  end

  get '/g' do
    player_hand = "グー"
    opponent = @janken.pon(player_hand)
    winner = case Boy2Man.judge(player_hand, opponent)
    when player_hand
      "player"
    when opponent
      "boy2man"
    else
      nil
    end

    JSON.generate({
      "player" => player_hand,
      "boy2man" => opponent,
      "winner" => winner
    }) 
  end

  get '/c' do
    player_hand = "チョキ"
    opponent = @janken.pon(player_hand)
    winner = case Boy2Man.judge(player_hand, opponent)
    when player_hand
      "player"
    when opponent
      "boy2man"
    else
      nil
    end

    JSON.generate({
      "player" => player_hand,
      "boy2man" => opponent,
      "winner" => winner
    }) 
  end

  get '/p' do
    player_hand = "パー"
    opponent = @janken.pon(player_hand)
    winner = case Boy2Man.judge(player_hand, opponent)
    when player_hand
      "player"
    when opponent
      "boy2man"
    else
      nil
    end

    JSON.generate({
      "player" => player_hand,
      "boy2man" => opponent,
      "winner" => winner
    }) 
  end  
end
