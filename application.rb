require 'sinatra'

get '/' do
  "Welcome! Enjoy your stay ... :-)"
end

get '/testimonials' do
  erb :testimonials
end