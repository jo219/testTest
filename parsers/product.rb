# require 'nokogiri'
# require 'open-uri'
# require 'json'

# content = URI.open('https://www.ebay.com/sch/i.html?_from=R40&_trksid=p2334524.m570.l1313&_nkw=quite+comfort+20&_sacat=0&LH_TitleDesc=0&_odkw=quiet+comfort&_osacat=0').read
html = Nokogiri.HTML(content)

# products = html.css('.srp-results .s-item')

# outputs = []

# products.each do |product|
# 	name = product.css('.s-item__title').text
# 	url = product.css('.s-item__link').attr('href').text

	# content2 = URI.open(url).read
	# html2 = Nokogiri.HTML(content2)
price = html.css('#prcIsum').text
# price = html.css('[itemprop="price"]').text if price.strip == ''
# raise 'something happen!' if price.strip == ''

outputs << {
	# page_type: 'product',
	# vars: {
	# 	'name' => name
	# }
	_collection: "products",
	name: page['vars']['name'],
	url: page['url'],
	price: price
}

# puts JSON.pretty_generate(outputs)