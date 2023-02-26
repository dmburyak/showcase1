require 'nokogiri'
require 'open-uri'

url = "https://nokogiri.org/tutorials/installing_nokogiri.html"
doc = Nokogiri::HTML(URI.open(url))

# Search for nodes by css
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

# Search for nodes by xpath
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

# Or mix and match
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end