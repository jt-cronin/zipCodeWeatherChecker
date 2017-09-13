require 'open-uri'
require 'pry'
require 'json'
require_relative 'functions.rb'


welcome = "What zip code would you like to look up?"

puts welcome

zipCode = gets.chomp
zipCode = zipCodeCheck(zipCode)

lat = latitude(parse_location(website_response(zipCode)))
lng = longitude(parse_location(website_response(zipCode)))

temp = currentTemp(parseWeather(openWeather(lat,lng)))
puts "the current temp is #{temp}"


