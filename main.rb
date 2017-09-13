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

# temp = WeatherClass.new
currentT = WeatherClass.new
temp = currentT.openWeather(lat, lng)
temp = currentT.parseWeather(temp)
temp = currentT.currentTemp(temp)

puts "the current temp is #{temp}"

yesterday = FindTime.new

y = yesterday.yesterdayTime()


ytemp = YesterdayWeather.new

yesterdayTemp = ytemp.yesterdayTemp(ytemp.parse_ytemp(ytemp.open_ytemp(lat, lng, y)))


puts "the temp yesterday at this time was #{yesterdayTemp}"

dif = tempDifference(temp, yesterdayTemp)

puts "the difference in temperature is #{dif.round(3)}"

if changeTemp(dif) == false
	puts "There was a significant change of temperature from yesterday"
else
	puts "There isnt really a change in temperature from yesterday"
end
