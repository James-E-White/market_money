require 'rails_helper'

describe 'Markets endpoints' do 
  it 'has a list of the markets' do 
    create_list(:market, 5)
     
    get '/api/v0/markets' 

    expect(response).to be_successful
    markets = JSON.parse(response.body, symbolize_names: true)[:data]
  
    
    expect(markets.count).to eq(5)
    markets.each do |market|
      expect(market).to have_key(:id)
      expect(market[:id].to_i).to be_an(Integer)

      expect(market[:attributes]).to have_key(:fmid)
      expect(market[:attributes][:fmid]).to be_a(Integer)

      expect(market[:attributes]).to have_key(:name)
      expect(market[:attributes][:name]).to be_a(String)

      expect(market[:attributes]).to have_key(:zip)
      expect(market[:attributes][:zip]).to be_a(String) 
    end
  end
   describe 'getting one market by id' do 
    it 'can get one market by id' do 
     market = Market.create(fmid: 122, name: "James")
     market2 = Market.create(fmid: 123, name: "Drew")
   
      get "/api/v0/markets/#{market.fmid}" 

      expect(response).to be_successful
      
      market_id = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(response).to be_successful
      expect(market_id[:attributes][:fmid]).to eq(market.fmid)
 
      expect(market_id[:attributes][:name]).to eq(market.name)
      expect(market_id[:attributes][:name]).to_not eq(market2.name)

    end

    it 'an invalid fmid returns a 404 error with message' do 
      get "/api/v0/markets/7"

      message = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status 404
      expect(message[:error]).to eq("No Market ID")

    end
  end


  describe 'market search params' do
    it 'gets all markets by name' do 
     market = create(:market, name: "Pearl")
      get "/api/v0/markets/search?name=Pearl"

      market_search = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(market_search[:attributes][:name]).to eq(market.name)
     
    end
  end
end