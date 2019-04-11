require 'rubygems'
require 'nokogiri'         
require 'open-uri'

def parser_cryptos_nom

	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	cryptos_nom = page.xpath(('//*[@id]/td[2]/a'))
	array_nom = []
	array_value = []

		cryptos_nom.each do |each_nom|
	  	array_nom << each_nom.text
	 	end

	cryptos_value = page.xpath(('//*[@id]/td[5]/a'))

		cryptos_value.each do |each_value|
	  	array_value << each_value.text
	 	end

	
	hash_crypto = Hash[array_nom.zip(array_value)]

	puts hash_crypto
end




parser_cryptos_nom