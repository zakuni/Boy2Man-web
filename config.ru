require 'bundler'

Bundler.require

require './main.rb'
set :cometio, :timeout => 120, :post_interval => 2, :allow_crossdomain => true
set :websocketio, :port => (ENV['WS_PORT'] || 9000).to_i
set :rocketio, :comet => true, :websocket => true
run App
