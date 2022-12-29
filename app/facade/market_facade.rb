class MarketFacade
  def self.service
    @service ||= MarketService.new
end

def self.get_all_markets
    market_data = service.get_all_markets
    binding.pry
    markets = market_data[:data].map do |market|
      Market.new(markets)
    end
  end
end