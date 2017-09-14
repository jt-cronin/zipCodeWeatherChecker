require 'pry'



class ZipCodeClass
	def zipInputConvert (input)
		code = "#{input}"
	end


	def is_length (input)
		input.length == 5
	end

	def is_integer (input)
		input.to_i > 9999
	end

	
	def zipRe
		puts "Your code must only have five numbers"
		input = gets.chomp
	end

	# checks that a given input is valid
	#
	# zip = a String to be checked
	#
	# Returns true if the conditions are met, and false if not
	def zipValidate(zip)
		is_length(zip) && is_integer(zip)
		# (input.to_i > 9999) && (input.length == 5)
	end



	# Loops until conditions are met
	#
	# zip = String to be checked
	#
	# Returns String that has been decided valid
	def zipCodeCheck(zip)
		until (zipValidate(zipInputConvert(zip)) == true)
			zip = zipRe()
		end
		return zip
	end

end
# Finds the difference between the two numbewrs
#
# a = the first Integer
# b = the second Integer
#
# returns a positive integer that is the differnece between the two numbers(also known as the absolute value of the difference)
def tempDifference(a,b)
	temp = a - b
	if (temp < 0)
		temp = temp * -1
	end
	return temp
end

# Checks to see if an integer is greater than 1
#
# a = Integer to be tested 
#
# Should return true if the number is less than 1, and false if a is greater than 1
def changeTemp(a)
	a <= 1
end

# Prints out a statement
#
# tf = Boolean value
#
# Prints either statement based on what the boolean returned
def printTemp(tf)
	if tf == false
		puts "There was a significant change of temperature from yesterday"
	else
		puts "There isnt really a change in temperature from yesterday"
	end
end


class ZipCodeConvert

	# Puts an integer into a string
	#
	# zipCode = an Integer of 5 digits
	#
	# Returns a string with the integer now as a part of the sring
	def urlZip(zipCode)
		"http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}"
	end

	# Goes to a url opens, and reads the page
	#
	# zipCode = a String that will be used to go to the url
	#
	# Returns a String with information about the url visited
	def website_response(zipCode)
		open(urlZip(zipCode)).read
	end

	# Parses a string into JSON data
	#
	# w_r = String to be parsed, must be in JSON
	#
	# Returns a hash from the string
	def parse_location(w_r)
		JSON.parse(w_r)
	end

	# Finds a specific value from a JSON string
	#
	# a = a Hash in JSON
	#
	# Returns an integer value
	def latitude(a)
		a['results'][0]['geometry']['location']['lat']
	end

	# Finds a specific value from a JSON string
	#
	# a = a Hash in JSON
	#
	# Returns an integer value
	def longitude(a)
		a['results'][0]['geometry']['location']['lng']
	end
end


class WeatherClass

	# Puts an integer into a string
	#
	# lat = an Integer
	# lng = an Integer
	#
	# Returns a string with the integer now as a part of the sring 
	def url(lat, lng) 
		"https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng}?exclude=flags,alerts,hourly,minutely,daily"
	end

	# Goes to a the url that was found using urlZip
	#
	# a = an integer
	# b = an integer
	#
	# Returns information about the url visited
	def openWeather(a, b)
		open(url(a, b)).read
	end

	#Parses a string into JSON data
	#
	#a = string to be parsed, must be in JSON format
	#
	#Returns a hash from the string
	def parseWeather(a)
		JSON.parse(a)
	end

	#Finds a specific value from a JSON string
	#
	#parseWeather= a hash that has been parsed from JSON
	#
	#Returns a single integer value
	def currentTemp(parseWeather)
		parseWeather['currently']['temperature']
	end
end



class FindTime

	#Finds the current time according to the EPOCH UNIX TIMESTAMP
	#
	#
	#
	#Returns the time in in seconds rather than a date
	def setTime
		Time.new.to_i
	end

	#Finds how the time, in seconds, from 24 agos using the EPOCH UNIX TIMESTAMP
	#
	#
	#
	#Returns an integer being the number of seconds that had passed 24 hours ago from the moment the program was ran
	def yesterdayTime
		setTime() - 86400
	end
end

class YesterdayWeather

	#Puts an integer into a string
	#
	#lat = an integer
	#lng = an integer
	#yesterday = integer
	#
	#Returns a string with the integer now as a part of the sring
	def ytemp_url (lat, lng, yesterday)
		"https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng},#{yesterday}?exclude=flags,alerts,hourly,minutely,daily"
	end

	#Goes to a the url that was found using urlZip
	#
	#lat = an integer
	#lng = an integer
	#yesterday = an integer
	#
	#Returns information about the url visited
	def open_ytemp (lat, lng, yesterday)
		open(ytemp_url(lat, lng, yesterday)).read
	end

	#Parses a string into JSON data
	#
	#oy = string to be parsed, must be in JSON format
	#
	#Returns a hash from the string
	def parse_ytemp (oy)
		JSON.parse(oy)
	end

	#Finds a specific value from a JSON string
	#
	#parseWeather= a hash that has been parsed from JSON
	#
	#Returns a single integer value
	def yesterdayTemp (py)
		py['currently']['temperature']
	end
end
