require 'open-uri'
require 'pry'
require 'json'
require_relative 'functions.rb'



# def zipCodeCheck(a)
# 	code = "#{a}"
# 	until (code.length == 5) && (code.to_i > 9999)
# 		puts "Your code must only have five numbers"
# 		code = gets.chomp
# 	end
# 	return code
# end




welcome = "What zip code would you like to look up?"

puts welcome

zipCode = gets.chomp
zipCode = zipCodeCheck(zipCode)

location = open("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}")
response_body = location.read
response_JSON = JSON.parse(response_body)
lat = response_JSON['results'][0]['geometry']['location']['lat']
lng = response_JSON['results'][0]['geometry']['location']['lng']

# puts currentTemp(parseWeather(openWeather(url(lat,lng))))

weather = open("https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng}?exclude=flags,alerts,hourly,minutely,daily")
weather_body = weather.read
weather_JSON = JSON.parse(weather_body)
currentTemp =  weather_JSON['currently']['temperature']
puts "the current temp is #{currentTemp}"




# class Coords
# 	def url(zipCode)
# 		"http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}"
# 	end

# 	def website_response
# 		open(url(zip)).read
# 	end

# 	def lat
# 		website_response['results'][0]['geometry']['location']['lat']
# 	end

# 	def long
# 		website_response['results'][0]['geometry']['location']['lng']
# 	end
# end