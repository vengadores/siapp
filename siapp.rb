# siapp.rb
require 'rubygems'
require 'sinatra'
require 'postmark'
require 'net/smtp'

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  File.read(File.join('static', 'index.html'))
end


# Create an instance of Postmark::ApiClient
client = Postmark::ApiClient.new('c0d2d117-11d4-4193-8917-c2ac56312399')


post '/send_data' do
    if params["email"].include? "@"
        # Envio de correo
        "OK!"
     else
        "Este correo es invalido"
    end
end

after "/send_data" do
    client.deliver(
      from: 'david@multidoctores.com',
      to: params["email"],
      subject: 'ola ke ace',
      html_body: 'Buen dia<strong> perritas</strong>.',
      track_opens: true)
end

