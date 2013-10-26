# -*- coding: utf-8 -*-
Slim::Engine.set_default_options :pretty => true

class App < Sinatra::Base
  use Rack::Session::Pool
  register Padrino::Sprockets
  sprockets

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  before do
    session["boy2man"] ||= Boy2Man::Janken.new
    @janken = session["boy2man"]
  end

  get '/' do
    slim :index, :locals => {:title => "Boy2Man"}
  end

  get '/g' do
    @janken.pon "グー"
  end
  
  get '/c' do
    @janken.pon "チョキ"
  end

  get '/p' do
    @janken.pon "パー"
  end
end
