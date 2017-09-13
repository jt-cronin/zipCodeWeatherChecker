require 'open-uri'
require 'pry'
require 'json'
require_relative 'functions.rb'


welcome = "What zip code would you like to look up?"

puts welcome

zipCode = gets.chomp
zipCode = zipCodeCheck(zipCode)

location = open("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}")
response_body = location.read
response_JSON = JSON.parse(response_body)
lat = response_JSON['results'][0]['geometry']['location']['lat']
lng = response_JSON['results'][0]['geometry']['location']['lng']

temp = currentTemp(parseWeather(openWeather(lat,lng)))
puts "the current temp is #{temp}"


