require 'httparty'

class Repository
    attr_accessor :name, :description, :star_count, :URL

    def initialize(name, description, star_count, url)
        @name = name
        @description = description
        @star_count = star_count
        @url = url
    end

    def to_s()
        "Name: #{@name}, Description: #{@description}, Star count: #{@star_count}, URL: #{@url}"
    end
end

username = "JacobHensley"
response = HTTParty.get("https://api.github.com/users/#{username}/repos")
result = []

response.each do |key|
    name = key["full_name"]
    desc = key["description"]
    star_count = key["stargazers_count"]
    url = key["html_url"]
    
    result.append(Repository.new(name, desc, star_count, url))
end

puts result.sort_by(&:star_count)[-1]