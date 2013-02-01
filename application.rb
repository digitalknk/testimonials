require 'sinatra'
require 'sinatra/captcha'
require 'mongoid'
require 'json'

Mongoid.load!("mongoid.yml")

class Testimonial
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :firstname
  field :lastname
  field :company
  field :city
  field :state
  field :country
  field :testimonial
  field :email

  validates_presence_of :firstname, :lastname, :testimonial, :email
end

get '/' do
  "Welcome! Enjoy your stay ... :-)"
end

get '/testimonials' do
  @testimonials = Testimonial.all
  erb :testimonials
end

get '/testimonials.json' do
    content_type :json
    all_testimonials = Testimonial.all
    all_testimonials.to_json
end

get '/form' do
  erb :form
end

post '/testimonial' do
  @testimonial = Testimonial.new(:firstname => params[:testimonial_firstname],
                                 :lastname => params[:testimonial_lastname],
                                 :company => params[:testimonial_company],
                                 :city => params[:testimonial_city],
                                 :state => params[:testimonial_state],
                                 :country => params[:testimonial_country],
                                 :testimonial => params[:testimonial_testimonial],
                                 :email => params[:testimonial_email]
                                 )

  if captcha_pass? && @testimonial.save
    redirect '/thankyou'
  else
    redirect '/testimonials'
  end
  # halt(401, "invalid captcha") unless captcha_pass?
  # "passed!"
end

get "/thankyou" do
  "Thank you for filling out the form."
end