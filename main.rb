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

yesterday = yesterdayTime()

ytemp = open_ytemp(lat, lng, yesterday)
ytemp = parse_ytemp(ytemp)
ytemp = yesterdayTemp(ytemp)
puts "the temp yesterday at this time was #{ytemp}"

dif = tempDifference(temp, ytemp)

puts "the difference in temperature is #{dif}"

if changeTemp(dif) == false
	puts "There was a significant change in temperature"
else
	puts "There isnt really a change in temperature from yesterday"
end
