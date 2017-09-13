require 'open-uri'
require 'pry'
require 'json'
require_relative 'functions.rb'


welcome = "What zip code would you like to look up?"


puts welcome
userInput= gets.chomp

zip = ZipCodeClass.new

zipCode = zip.zipCodeCheck(userInput)


zipLat = ZipCodeConvert.new
zipLng = ZipCodeConvert.new

lat = zipLat.latitude(zipLat.parse_location(zipLat.website_response(zipCode)))
lng = zipLng.longitude(zipLng.parse_location(zipLng.website_response(zipCode)))

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

printTemp(changeTemp(dif))

