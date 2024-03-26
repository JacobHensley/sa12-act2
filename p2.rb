require 'httparty'

class Coin
    attr_accessor :name, :current_price, :market_cap

    def initialize(name, current_price, market_cap)
        @name = name
        @current_price = current_price
        @market_cap = market_cap
    end

    def to_s()
        "Name: #{@name}, Market cap: #{@market_cap}"
    end
end

response = HTTParty.get("https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd")
result = []

response.each do |key|
    name = key["name"]
    current_price = key["current_price"]
    market_cap = key["market_cap"]
    result.append(Coin.new(name, current_price, market_cap))
end

result = result.sort_by(&:market_cap).reverse!
puts result[0, 5]