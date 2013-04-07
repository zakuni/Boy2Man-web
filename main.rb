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
    session["boy2man"] ||= Boy2Man::Boy2Man.new
    @b = session["boy2man"]
  end

  get '/' do
    slim :index, :locals => {:title => "Boy2Man"}
  end

  get '/g' do
    @b.match "グー"
  end
  
  get '/c' do
    @b.match "チョキ"
  end

  get '/p' do
    @b.match "パー"
  end
end
