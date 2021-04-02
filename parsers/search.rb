# require 'nokogiri'
# require 'open-uri'
# require 'json'

# content = URI.open('https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2334524.m570.l1313&_nkw=quite+comfort+20&_sacat=0&LH_TitleDesc=0&_odkw=quiet+comfort&_osacat=0').read
html = Nokogiri.HTML(content)

products = html.css('.srp-results .s-item')

# outputs = []

products.each do |product|
	name = product.css('.s-item__title').text
	url = product.css('.s-item__link').attr('href').text
	effective_url = url

	pages << {
		url: url,
		page_type: 'product',
		vars: {
			'name' => name
		}
	}
end

# puts JSON.pretty_generate(outputs)