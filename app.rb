require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
get("/square/new") do
  erb(:squareTemp)
end
get("/square") do
  number=params.fetch("number").to_f
  number=number**2
  "#{number}"
end

get("/square_root/new") do
  erb(:rootTemp)
end
get("/square_root") do
  number=params.fetch('number').to_f
  number=number**0.5
  "#{number}"
end

get("/random/new") do
  erb(:randTemp)
end

get("/random") do
  min=params.fetch("minimum").to_f
  max=params.fetch("maximum").to_f
  returnNum=rand(min..max)
  "#{returnNum}"
end

get("/payment/new") do
  erb("paymentTemp")
