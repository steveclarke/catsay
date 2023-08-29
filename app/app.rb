require "sinatra"

set :bind, ENV.fetch("BINDING")
set :port, ENV.fetch("PORT")

Tilt.register Tilt[:erb], :'html.erb'

get "/" do
  erb :index
end

post "/" do
  @zoni_message = params["zoni-message"]
  @carlos_message = params["carlos-message"]
  @pic = case params["where"]
         when "piano" then "piano"
         else "stairs"
         end
  erb :index
end

