require 'spec_helper'
require_relative '../main.rb'



describe 'check zip code' do
	it 'makes sure that the user input is five digits and only numbers' do
		input1 = zipCodeCheck(55555)
		input2 = zipCodeCheck(jaowi)
		expect(input1).to eq(55555)
		expect(input2).to eq(nil)
	end
end

