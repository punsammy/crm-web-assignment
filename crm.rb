# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'
require 'pry'
# Fake data
# Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
# Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
# Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('Betty', 'Maker','betty@bitmaker.come', 'Developer')

get '/' do
  @crm_app_name = "Amanda's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/new_contact' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/1' do
  @contact = Contact.find(1)
  erb :show_contact
end
