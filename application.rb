require 'sinatra'
require 'sinatra/captcha'

get '/' do
  "Welcome! Enjoy your stay ... :-)"
end

get '/testimonials' do
  erb :testimonials
end

post '/testimonials' do
  halt(401, "invalid captcha") unless captcha_pass?
  "passed!"
end