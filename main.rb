require 'open-uri'
require 'pry'
require 'json'




def zipCodeCheck(a)
	code = "#{a}"
	until (code.length == 5) && (code.to_i > 9999)
		puts "Your code must only have five numbers"
		code = gets.chomp
	end
	return code
end




welcome = "What zip code would you like to look up?"

puts welcome

zipCode = gets.chomp
zipCode = zipCodeCheck(zipCode)

website = open("http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}")
response_status = website.status
response_body = website.read
response_JSON = JSON.parse(response_body)


puts response_status
binding.pry
puts response_JSON['results'][0]['geometry']['location']



