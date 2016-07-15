# siapp.rb
require 'rubygems'
require 'sinatra'

get '/' do
  File.read(File.join('public', 'index.html'))
end

post '/send_data' do
    if params["email"].include? "@"
        "Este correo es valido"
    else
        "Este correo es invalido"
    end
end
