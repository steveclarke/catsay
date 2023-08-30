require "sinatra"
require "fileutils"
require "pathname"

set :bind, ENV.fetch("BINDING")
set :port, ENV.fetch("PORT")

Tilt.register Tilt[:erb], :'html.erb'

ROOT = (Pathname(__FILE__).dirname / "..").expand_path
PIDS = ROOT / "tmp" / "pids"
FileUtils.mkdir_p PIDS
File.open(PIDS / "server.pid","w") do |file|
  file.puts $$
end

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

