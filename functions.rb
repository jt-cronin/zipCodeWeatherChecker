require 'pry'



#Checks to make sure that the user input is a valid zipcode, being five number digits '#####'
#
#input = user input that comes in as a string
#
#Returns true if the conditions are met, and false if not
def zipValidate(input)
	valid = false
	if (input.length == 5) && (input.to_i > 9999)
		valid = true
	end
	return valid
end


#Takes input from the user, changes it into a string, and sends it zipValidate to be checked.
#Until the zipValidate is true, it will keep asking for a zipcode
#
#input = the text that the user input
#
#returns the user's input if it has been found true
def zipCodeCheck(input)
	code = "#{input}"
	until (zipValidate(code) == true)
		puts "Your code must only have five numbers"
		code = gets.chomp
	end
	return code
end


#Finds the difference between the two numbewrs that are being passed in
#
#a = the first number being passed
#b = the second number being passed
#
#returns a positive integer that is the differnece between the two numbers(also known as the absolute value of the difference)
def tempDifference(a,b)
	temp = a - b
	if (temp < 0)
		temp = temp * -1
	end
	return temp
end

#Checks to see if an integer is greater than 1
#
#a = integer to be tested 
#
#Should return true if the number is less than 1, and false if a is greater than 1
def changeTemp(a)
	sameT = false
	if (a > 1)
		sameT = false
	else
		sameT = true
	end
	return sameT
end


#ZIPCODE CLASS

def urlZip(zipCode)
	"http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:#{zipCode}"
end

def website_response(zipCode)
	open(urlZip(zipCode)).read
end

def parse_location(w_r)
	JSON.parse(w_r)
end

def latitude(a)
	a['results'][0]['geometry']['location']['lat']
end

def longitude(a)
	a['results'][0]['geometry']['location']['lng']
end


class WeatherClass 
	def url(lat, lng) 
		"https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng}?exclude=flags,alerts,hourly,minutely,daily"
	end

	def openWeather(a, b)
		open(url(a, b)).read
	end

	def parseWeather(a)
		JSON.parse(a)
	end

	def currentTemp(parseWeather)
		parseWeather['currently']['temperature']
	end
end


class FindTime
	def setTime
		Time.new.to_i
	end

	def yesterdayTime
		setTime() - 86400
	end
end

class YesterdayWeather
	def ytemp_url (lat, lng, yesterday)
		"https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng},#{yesterday}?exclude=flags,alerts,hourly,minutely,daily"
	end

	def open_ytemp (lat, lng, yesterday)
		open(ytemp_url(lat, lng, yesterday)).read
	end

	def parse_ytemp (oy)
		JSON.parse(oy)
	end

	def yesterdayTemp (py)
		py['currently']['temperature']
	end
end
