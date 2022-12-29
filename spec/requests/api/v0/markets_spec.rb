require 'rails_helper'

describe 'Markets endpoints' do 
    it 'has a list of the markets' do 
     create_list(:market, 5)
     
     get '/api/v0/markets' 

      expect(response).to be_successful
      markets = JSON.parse(response.body)
   
      expect(Market.count).to eq(5)
    end
end