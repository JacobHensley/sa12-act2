require 'httparty'

area = "America"
location = "New_York"

response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
datetime = response["datetime"]
date = datetime.scan(/\d{4}-\d{2}-\d{2}/)[0]
time = datetime.scan(/\d{2}:\d{2}:\d{2}/)[0]

puts "The current time in #{area}/#{location} is #{date} #{time}"