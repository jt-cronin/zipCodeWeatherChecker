require 'pry'




def zipCodeCheck(a)
	code = "#{a}"
	until (code.length == 5) && (code.to_i > 9999)
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
