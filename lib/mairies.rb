require 'nokogiri'
require 'pry'
require 'byebug'         
require 'open-uri'


def get_mairies_email(mairies_url)
	doc = Nokogiri::HTML(open(doc = mairies_url))

		first_email = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

	return first_email.text
end

puts get_mairies_email("https://www.annuaire-des-mairies.com/95/avernes.html")


def mairies_url
	doc = Nokogiri::HTML(open(doc = "https://www.annuaire-des-mairies.com/val-d-oise.html"))
	city_names = doc.xpath('//*[@class="lientxt"]')

	# city_names = doc.xpath('//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a')

	city_names_array = []
	city_email_array = []

	city_names.each do |node|
		city_names_array << node.text
		url = "https://www.annuaire-des-mairies.com" + node["href"][1..-1]
		email = get_mairies_email(url) 
		city_email_array << email
	end
	#puts city_names_array
	#puts city_email_array

	 	
	my_hash = city_names_array.zip(city_email_array).to_h
 	
 	return my_hash.each_slice(1).map(&:to_h)

end

begin
  mairies_url #partie de code qui risque de produire une erreur
rescue StandardError => e
  puts "Oups petite erreur, mais c'est pas grave" #résultat que tu veux voir en lieu et place d'une erreur terminal
end

 mairies_url