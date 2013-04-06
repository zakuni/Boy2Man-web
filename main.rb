# -*- coding: utf-8 -*-
Slim::Engine.set_default_options :pretty => true

class App < Sinatra::Base
  register Padrino::Sprockets
  sprockets

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  before do
    @b = Boy2Man::Boy2Man.new
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
