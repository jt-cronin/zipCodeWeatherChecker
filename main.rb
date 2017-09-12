require 'open-uri'
require 'pry'
require 'json'




def zipCodeCheck
	
end


welcome = "What zip code would you like to look up?"

puts welcome

zipCode = gets.chomp


website = open("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}")
response_status = website.status
response_body = website.read
response_JSON = JSON.parse(response_body)

puts response_status
puts response_JSON['results'][0]



