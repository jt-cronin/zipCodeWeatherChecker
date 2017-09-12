require 'spec_helper'
require_relative '../main.rb'



describe 'valid_Zip' do
	it 'makes sure that the user input is five digits and only numbers' do
		input1 = zipCodeCheck(55555)
		input2 = zipCodeCheck(jaowi)
		expect(input1).to eq(55555)
		expect(input2).to eq(nil)
	end
end

describe 'temperature_Math' do
	it 'finds the difference between the two temperatures'	do
		a = 78
		b = 84
		c = tempDifference(a, b)
		expect(c).to eq(6)
	end
end


describe 'temperature_Change' do
	it 'checks to see if there was a change by more than one degree' do
		a = changeTemp(3)
		b = changeTemp(1)
		expect(a).to eq(false)
		expect(b).to eq(true)
	end
end

