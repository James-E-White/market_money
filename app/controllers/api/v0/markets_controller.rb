class Api::V0::MarketsController < ApplicationController 
  def index 
   render json: MarketSerializer.new(Market.all) #@markets = MarketFacade.new 
  end

  def show
    market = Market.find_by(params[:fmid])
    if market 
      render json: MarketSerializer.new(market) 
    else 
       render json: {error: "No Market ID"}, status: 404
    end
  end
end