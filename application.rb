require 'sinatra'
require 'sinatra/captcha'
require 'mongoid'

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
  erb :testimonials
end

post '/testimonials' do
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