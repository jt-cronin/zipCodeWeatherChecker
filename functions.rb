require 'pry'

def zipValidate(a)
	valid = false
	if (a.length == 5) && (a.to_i > 9999)
		valid = true
	end
	return valid
end



def zipCodeCheck(a)
	code = "#{a}"
	until (zipValidate(code) == true)
		puts "Your code must only have five numbers"
		code = gets.chomp
	end
	return code
end



def tempDifference(a,b)
	temp = a - b
	if (temp < 0)
		temp = temp * -1
	end
	return temp
end


def changeTemp(a)
	sameT = false
	if (a > 1)
		sameT = false
	else
		sameT = true
	end
	return sameT
end




def url(lat, lng) 
	"https://api.darksky.net/forecast/417cf2294f994c32942f8907ab079e31/#{lat},#{lng}?exclude=flags,alerts,hourly,minutely,daily"
end

def openWeather(url)
	open(url(lat, lng)).read
end

def parseWeather(openWeather)
	JSON.parse(openWeather)
end

def currentTemp(parseWeather)
	parseWeather['currently']['temperature']
end

