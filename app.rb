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
get("/square/results") do
  number=params.fetch("number").to_f
  number=number**2
  "#{number}"
end

get("/square_root/new") do
  erb(:rootTemp)
end
get("/square_root/results") do
  number=params.fetch('number').to_f
  number=number**0.5
  "#{number}"
end

get("/random/new") do
  erb(:randTemp)
end

get("/random/results") do
  min=params.fetch("minimum").to_f
  max=params.fetch("maximum").to_f
  returnNum=rand(min..max)
  "Random Number \n #{returnNum}"
end

get("/payment/new") do
  erb(:paymentTemp)
end
get("/payment/results") do
  @apr=params.fetch("APR").to_f
  apr=@apr/100
  apr=apr/12
  @years=params.fetch("years").to_i
  months=@years*12
  @pv=params.fetch("PV").to_f
  numerator=apr*@pv
  denom= 1-(1+apr)**(-1*months)
  @outcome=(numerator/denom).to_fs(:currency)
  erb(:paymentOut)
end
