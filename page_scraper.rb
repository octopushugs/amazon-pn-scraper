require 'mechanize'
require 'nokogiri'
require 'csv'

class Scraper
	def init
		pnArray = Array.new
		mech = Mechanize.new
		page = mech.get('') #<<Put your Amazon product URL here

		#Now go through the <select> to get product numbers for the different flavors
		flavorForm = page.form_with(:id => 'twister')
		flavorSelect = flavorForm.field_with(:name => 'dropdown_selected_flavor_name')
		flavorSelect.options.each do |o| #Just making sure that the option isn't blank
			if (o.text != "")
				value = o
			end
	
			productNumber = trim_pn(value.to_s[2..12])
			pnArray.push(productNumber)
		end

		write_to_file(pnArray)
	end

	#Checks validity of product number and removes excess characters if necessary
	def trim_pn(pn)
		if (pn[0] == ",")
			pn = pn[1..-1]
		end
		return pn
	end

	#Write product numbers to CSV
	def write_to_file(pn)
		CSV.open("productnumbers.csv", "w") do |csv|
			csv << pn
		end
	end
end

p = ProteinScraper.new
p.init

