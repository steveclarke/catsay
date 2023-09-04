require "sinatra"
require "fileutils"
require "pathname"
require "redis"
require "dotenv"

RACK_ENV = ENV.fetch("RACK_ENV")
Dotenv.load(".env.#{RACK_ENV}", ".env.#{RACK_ENV}.local")

set :bind, ENV.fetch("BINDING")
set :port, ENV.fetch("PORT")

Tilt.register Tilt[:erb], :'html.erb'

ROOT = (Pathname(__FILE__).dirname / "..").expand_path
PIDS = ROOT / "tmp" / "pids"
FileUtils.mkdir_p PIDS
File.open(PIDS / "server.pid","w") do |file|
  file.puts $$
end

REDIS = Redis.new(url: ENV.fetch("REDIS_URL"))

def generate_ideas
  messages = REDIS.smembers("messages") || []
  messages.shuffle[0..1]
end

get "/" do
  @ideas = generate_ideas
  erb :index
end

get "/random" do
  @ideas = generate_ideas
  @zoni_message , @carlos_message = generate_ideas
  @pic = [ "piano", "stairs", "box" ].sample
  erb :index
end

post "/" do
  @ideas = generate_ideas
  @zoni_message = params["zoni-message"]
  @carlos_message = params["carlos-message"]
  @pic = case params["where"]
         when "piano" then "piano"
         else "stairs"
         end
  REDIS.sadd("messages", @zoni_message)
  REDIS.sadd("messages", @carlos_message)
  erb :index
end

